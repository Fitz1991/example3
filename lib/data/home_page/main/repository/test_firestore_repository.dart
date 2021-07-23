import 'package:republic_on_volga/data/home_page/main/provider/test_firestore_provider.dart';
import 'package:republic_on_volga/data/home_page/main/repository/test_repository.dart';
import 'test_repository.dart';

class TestFirestoreRepository implements TestRepository {
  var provider = TestFirestoreProvider();

  @override
  Stream<T> tests<T>() {
    return provider.getTests() as Stream<T>;
  }
}
