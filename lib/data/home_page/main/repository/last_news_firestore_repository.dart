import 'package:republic_on_volga/data/home_page/main/provider/last_news_firestore_provider.dart';

import 'last_news_repository.dart';

class LastNewsFirestoreRepository implements LastNewsRepository{
  var provider = LastNewsFirestoreProvider();

  @override
  Stream<T> lastNews<T>() {
   return provider.lastNews() as Stream<T>;
  }
}