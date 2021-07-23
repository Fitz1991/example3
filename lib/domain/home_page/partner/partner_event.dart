part of 'partner_bloc.dart';

@immutable
abstract class PartnerEvent {}

class GetPartnerEvent extends PartnerEvent{}
class LoadingPartnerEvent extends PartnerEvent{}
class SuccessPartnerEvent extends PartnerEvent{
  BuiltList<Partner> partners;

  SuccessPartnerEvent({this.partners});
}
class ErrorPartnerEvent extends PartnerEvent{
  String message;

  ErrorPartnerEvent({this.message});
}
