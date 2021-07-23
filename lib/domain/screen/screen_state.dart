part of 'screen_cubit.dart';

@immutable
abstract class ScreenState {
  double height;
}

class ScreenInitial extends ScreenState {}
class ScreenHeight extends ScreenState {
  double height;

  ScreenHeight(this.height);
}
