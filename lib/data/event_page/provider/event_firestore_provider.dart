import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/event.dart';
import 'package:republic_on_volga/model/serialazers.dart';

class EventFirestoreProvider {
  CollectionReference eventCollection =
  FirebaseFirestore.instance.collection('events');

  Stream<List<Event>> event() {
    return eventCollection.snapshots().map((event) {
      return event.docs.map((e) {
        final event = serializers.deserializeWith(
          Event.serializer,
          e.data(),
        );
        return event.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}
