import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/partner.dart';
import 'package:republic_on_volga/model/serialazers.dart';

class PartnerFirestoreProvider {
  CollectionReference partnerCollection =
      FirebaseFirestore.instance.collection('partners');

  Stream<List<Partner>> partner() {
    return partnerCollection.snapshots().map((event) {
      return event.docs.map((e) {
        final partner = serializers.deserializeWith(
          Partner.serializer,
          e.data(),
        );
        return partner.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}
