part of 'screen_navigator_bloc.dart';

@immutable
abstract class HomeScreenNavigatorEvent {}

class NavigateInitialScreen extends HomeScreenNavigatorEvent{
}

class NavigateLastNewsScreen extends HomeScreenNavigatorEvent{
}

class NavigateCommandScreen extends HomeScreenNavigatorEvent{
}

class NavigatePartnersScreen extends HomeScreenNavigatorEvent{
}

class NavigateConcursScreen extends HomeScreenNavigatorEvent{
}

class NavigateSuvenirsScreen extends HomeScreenNavigatorEvent{
}
