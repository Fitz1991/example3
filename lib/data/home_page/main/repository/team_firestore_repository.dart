import 'package:republic_on_volga/data/home_page/main/provider/team_firestore_provider.dart';
import 'package:republic_on_volga/data/home_page/main/repository/team_repository.dart';

class TeamFirestoreRepository implements TeamRepository {
  var provider = TeamFirestoreProvider();

  @override
  Stream<T> team<T>() {
    return provider.team() as Stream<T>;
  }
}
