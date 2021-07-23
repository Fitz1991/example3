part of 'navigation_bloc.dart';

@immutable
class NavigationState {
  final NavItem selectedItem;
  const NavigationState(this.selectedItem);
}

enum NavItem {
  home_page,
  events_page,
  archive_page,
  runes_page,
  lection_page,
}