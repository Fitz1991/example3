import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenInitial());

  getScreenHeight(double maxHeight){
    double height = _screenHeightExcludingToolbar(maxHeight);
    emit(ScreenHeight(height));
  }

  double _screenHeight(double maxHeight,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return (maxHeight - reducedBy) / dividedBy;
  }

  double _screenHeightExcludingToolbar(double maxHeight,
      {double dividedBy = 1}) {
    return _screenHeight(maxHeight, dividedBy: dividedBy, reducedBy: kToolbarHeight);
  }
}
