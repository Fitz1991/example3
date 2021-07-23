part of 'screen_navigator_bloc.dart';

@immutable
abstract class HomeScreenNavigatorState {
  String title;
}

class ScreenNavigatorInitial extends HomeScreenNavigatorState {
  String title = 'Главная';
}

class LastNewsScreen extends HomeScreenNavigatorState{
  String title = 'Последние новости';
}

class CommandScreen extends HomeScreenNavigatorState{
  String title = 'Команда';
}

class PartnersScreen extends HomeScreenNavigatorState{
  String title = 'Партнеры';
}

class ConcursScreen extends HomeScreenNavigatorState{
  String title = 'Тесты';
}

class SuvenirsScreen extends HomeScreenNavigatorState{
  String title = 'Сувениры';
}
