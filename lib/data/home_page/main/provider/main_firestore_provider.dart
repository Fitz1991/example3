import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/main.dart';
import 'package:republic_on_volga/model/home_page/main/main.dart';
import 'package:republic_on_volga/model/serialazers.dart';

class MainFirestoreProvider {
  CollectionReference mainCollection =
      FirebaseFirestore.instance.collection('main');

  Stream<Main> main() {
    return mainCollection.snapshots().map((event) {
      log.i(event);
      return event.docs.map((e) {
        final main = serializers.deserializeWith(
          Main.serializer,
          e.data(),
        );
        return main.rebuild((builder) => builder..id = e.id);
      }).first;
    });
  }
}
