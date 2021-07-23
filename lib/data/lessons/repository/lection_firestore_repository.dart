import 'package:republic_on_volga/data/lessons/providers/lection_firestore_provider.dart';
import 'package:republic_on_volga/data/lessons/repository/lection_repository.dart';

class LectionFirestoreRepository implements LectionRepository {
  var provider = LectionFirestoreProvider();


  @override
  Stream<T> lections<T>() {
    return provider.lection() as Stream<T>;
  }
}
