import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/model/volga_slider_model.dart';

part 'volga_slider_event.dart';
part 'volga_slider_state.dart';

class VolgaSliderBloc extends Bloc<VolgaSliderEvent, VolgaSliderState> {
  VolgaSliderBloc(BuiltList<VolgaSliderModel> sliderItems) : super(VolgaSliderInitial(sliderItems));

  @override
  Stream<VolgaSliderState> mapEventToState(
    VolgaSliderEvent event,
  ) async* {
    if(event is UpdateSlider) yield VolgaSliderUpdated(event.sliderItems);
  }
}
