import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/archive_page/repository/archive_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/model/archive.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/main.dart';

part 'archive_event.dart';
part 'archive_state.dart';

class ArchiveBloc extends Bloc<ArchiveEvent, ArchiveState> {
  ArchiveBloc({this.archiveRepository}) : super(ArchiveInitial());

  ArchiveRepository archiveRepository;

  @override
  Stream<ArchiveState> mapEventToState(
    ArchiveEvent event,
  ) async* {
    if (event is GetArchiveEvent) yield* _getArchive();
    if (event is SuccessArchiveEvent)
      yield ArchiveData(archives: event.archives);
    if (event is ErrorArchiveEvent) yield ErrorArchive(message: event.message);
    if (event is LoadingArchiveEvent) yield LoadingArchive();
  }

  Stream<ArchiveState> _getArchive() async* {
    add(LoadingArchiveEvent());
    try {
      var archives = (archiveRepository.archives() as Stream<List<Archive>>);
      handleTimeout(archives, (err) => add(ErrorArchiveEvent(message: err)));
      archives.listen((archive) {
        add(SuccessArchiveEvent(archives: BuiltList.from(archive)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorArchiveEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
