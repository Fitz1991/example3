import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:republic_on_volga/model/home_page/main/news.dart';
import 'package:republic_on_volga/model/serialazers.dart';

class LastNewsFirestoreProvider {
  CollectionReference lastNewsCollection =
      FirebaseFirestore.instance.collection('news');

  Stream<List<News>> lastNews() {
    return lastNewsCollection
        .orderBy('date', descending: true)
        // .limit(5)
        .snapshots()
        .map((event) {
      return event.docs.map((e) {
        final news = serializers.deserializeWith(
          News.serializer,
          e.data(),
        );
        return news.rebuild((builder) => builder..id = e.id);
      }).toList();
    });
  }
}
