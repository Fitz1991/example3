import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screen_navigator_event.dart';
part 'screen_navigator_state.dart';

class HomeScreenNavigatorBloc extends Bloc<HomeScreenNavigatorEvent, HomeScreenNavigatorState> {
  HomeScreenNavigatorBloc() : super(ScreenNavigatorInitial());

  @override
  Stream<HomeScreenNavigatorState> mapEventToState(
    HomeScreenNavigatorEvent event,
  ) async* {
      if(event is NavigateInitialScreen) yield ScreenNavigatorInitial();
      if(event is NavigateLastNewsScreen) yield LastNewsScreen();
      if(event is NavigateCommandScreen) yield CommandScreen();
      if(event is NavigatePartnersScreen) yield PartnersScreen();
      if(event is NavigateConcursScreen) yield ConcursScreen();
      if(event is NavigateSuvenirsScreen) yield SuvenirsScreen();
  }
}
