import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(NavItem.home_page));

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if(event is NavigateTo){
      if(event.destination != state.selectedItem){
        yield NavigationState(event.destination);
      }
    }
  }
}
