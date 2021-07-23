import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/assembly_master_classes.dart';
import 'package:republic_on_volga/model/serialazers.dart';

class LectionFirestoreProvider {
  CollectionReference lectionCollection =
  FirebaseFirestore.instance.collection('lections');

  Stream<List<AssemblyMasterClasses>> lection() {
    return lectionCollection.snapshots().map((event) {
      return event.docs.map((e) {
        final lection = serializers.deserializeWith(
          AssemblyMasterClasses.serializer,
          e.data(),
        );
        return lection.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}
