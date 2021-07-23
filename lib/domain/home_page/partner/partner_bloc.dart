import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:republic_on_volga/data/home_page/main/repository/partner_repository.dart';
import 'package:republic_on_volga/domain/utils/crash_reporter.dart';
import 'package:republic_on_volga/domain/utils/timeout_handler.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/model/partner.dart';

part 'partner_event.dart';

part 'partner_state.dart';

class PartnerBloc extends Bloc<PartnerEvent, PartnerState> {
  PartnerBloc({this.partnerRepository}) : super(PartnerInitial());

  PartnerRepository partnerRepository;

  @override
  Stream<PartnerState> mapEventToState(
    PartnerEvent event,
  ) async* {
    if (event is GetPartnerEvent) yield* _getPartner();
    if (event is SuccessPartnerEvent)
      yield PartnerData(partners: event.partners);
    if (event is ErrorPartnerEvent) yield ErrorPartner(message: event.message);
    if (event is LoadingPartnerEvent) yield LoadingPartner();
  }

  Stream<PartnerState> _getPartner() async* {
    add(LoadingPartnerEvent());
    try {
      var partners = (partnerRepository.partners() as Stream<List<Partner>>);
      handleTimeout(partners, (err) => add(ErrorPartnerEvent(message: err)));
      partners.listen((partner) {
        add(SuccessPartnerEvent(partners: BuiltList.from(partner)));
      }).onError((err, stackTrace) {
        log.e(err, err, stackTrace);
        reportError(exception: err, stack: stackTrace);
        add(ErrorPartnerEvent(message: err.toString()));
      });
    } catch (e, stacktrace) {
      log.e(e, e, stacktrace);
    }
  }
}
