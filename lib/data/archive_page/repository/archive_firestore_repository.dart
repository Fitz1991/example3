import 'package:republic_on_volga/data/archive_page/provider/archive_firestore_provider.dart';
import 'package:republic_on_volga/data/archive_page/repository/archive_repository.dart';

class ArchiveFirestoreRepository implements ArchiveRepository {
  var provider = ArchiveFirestoreProvider();
  @override
  Stream<T> archives<T>() {
    return provider.archive() as Stream<T>;
  }
}
