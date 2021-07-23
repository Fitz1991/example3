import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/home_page/main/repository/team_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/model/member.dart';

import '../../../main.dart';

part 'team_event.dart';

part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  TeamBloc({this.teamRepository}) : super(TeamInitial());

  TeamRepository teamRepository;

  @override
  Stream<TeamState> mapEventToState(
    TeamEvent event,
  ) async* {
    if (event is GetTeamEvent) yield* _getTeam();
    if (event is SuccessTeamEvent) yield TeamData(members: event.members);
    if (event is ErrorTeamEvent) yield ErrorTeam(message: event.message);
    if (event is LoadingTeamEvent) yield LoadingTeam();
  }

  Stream<TeamState> _getTeam() async* {
    add(LoadingTeamEvent());
    try {
      var team = (teamRepository.team() as Stream<List<Member>>);
      handleTimeout(team, (err) => add(ErrorTeamEvent(message: err)));
      team.listen((team) {
        add(SuccessTeamEvent(members: BuiltList.from(team)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorTeamEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
