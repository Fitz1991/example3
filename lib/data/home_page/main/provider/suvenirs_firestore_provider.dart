import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/serialazers.dart';
import 'package:republic_on_volga/model/suvenir.dart';

class SuvenirsFirestoreProvider {
  CollectionReference suvenirsCollection =
  FirebaseFirestore.instance.collection('suvenir');

  Stream<List<Suvenir>> suvenirs() {
    return suvenirsCollection.snapshots().map((event) {
      return event.docs.map((e) {
        final suvenirs = serializers.deserializeWith(
          Suvenir.serializer,
          e.data(),
        );
        return suvenirs.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}
