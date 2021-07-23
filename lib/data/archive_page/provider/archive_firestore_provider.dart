import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/serialazers.dart';
import 'package:republic_on_volga/model/archive.dart';

class ArchiveFirestoreProvider {
  CollectionReference archiveCollection =
  FirebaseFirestore.instance.collection('archives');

  Stream<List<Archive>> archive() {
    return archiveCollection.snapshots().map((archive) {
      return archive.docs.map((e) {
        final archive = serializers.deserializeWith(
          Archive.serializer,
          e.data(),
        );
        return archive.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}