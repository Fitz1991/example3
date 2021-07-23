import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/member.dart';
import 'package:republic_on_volga/model/serialazers.dart';

class TeamFirestoreProvider {
  CollectionReference teamCollection =
      FirebaseFirestore.instance.collection('member');

  Stream<List<Member>> team() {
    return teamCollection.orderBy('created').snapshots().map(
            (event) {
      return event.docs.map((e) {
        final team = serializers.deserializeWith(
          Member.serializer,
          e.data(),
        );
        return team.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}
