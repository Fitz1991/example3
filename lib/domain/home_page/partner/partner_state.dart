part of 'partner_bloc.dart';

@immutable
abstract class PartnerState {}

class PartnerInitial extends PartnerState {}

class PartnerData extends PartnerState {
  BuiltList<Partner> partners;

  PartnerData({this.partners});
}

class ErrorPartner extends PartnerState {
  String message;
  ErrorPartner({this.message});
}

class LoadingPartner extends PartnerState {}