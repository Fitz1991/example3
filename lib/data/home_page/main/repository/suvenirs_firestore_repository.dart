import 'package:republic_on_volga/data/home_page/main/provider/suvenirs_firestore_provider.dart';
import 'package:republic_on_volga/data/home_page/main/repository/suvenir_repository.dart';

class SuvenirsFirestoreRepository implements SuvenirsRepository {
  var provider = SuvenirsFirestoreProvider();

  @override
  Stream<T> suvenirs<T>() {
    return provider.suvenirs() as Stream<T>;
  }
}
