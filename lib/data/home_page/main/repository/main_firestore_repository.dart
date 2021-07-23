import 'package:republic_on_volga/data/home_page/main/provider/main_firestore_provider.dart';
import 'package:republic_on_volga/data/home_page/main/repository/main_repository.dart';

class MainFirestoreRepository implements MainRepository{
  MainFirestoreProvider provider = MainFirestoreProvider();

  @override
  Stream<T> main<T>() {
    return provider.main() as Stream<T>;
  }
}