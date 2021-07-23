part of 'volga_slider_bloc.dart';

@immutable
abstract class VolgaSliderEvent {}

class UpdateSlider extends VolgaSliderEvent{
  BuiltList<VolgaSliderModel> sliderItems;

  UpdateSlider(this.sliderItems);
}


