import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/serialazers.dart';
import 'package:republic_on_volga/model/volga_test.dart';

class TestFirestoreProvider {
  CollectionReference testCollection =
  FirebaseFirestore.instance.collection('test');

  Stream<List<VolgaTest>> getTests() {
    return testCollection.snapshots().map((event) {
      return event.docs.map((e) {
        final test = serializers.deserializeWith(
          VolgaTest.serializer,
          e.data(),
        );
        return test.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}
