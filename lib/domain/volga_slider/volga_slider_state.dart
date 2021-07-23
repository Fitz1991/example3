part of 'volga_slider_bloc.dart';

@immutable
abstract class VolgaSliderState {
  BuiltList<VolgaSliderModel> sliderItems;
}

class VolgaSliderInitial extends VolgaSliderState {
  BuiltList<VolgaSliderModel> sliderItems;
  VolgaSliderInitial(this.sliderItems);
}

class VolgaSliderUpdated extends VolgaSliderState {
  BuiltList<VolgaSliderModel> sliderItems;
  VolgaSliderUpdated(this.sliderItems);
}