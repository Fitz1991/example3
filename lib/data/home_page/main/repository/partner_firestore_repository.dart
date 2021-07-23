import 'package:republic_on_volga/data/home_page/main/provider/partner_firestore_provider.dart';
import 'partner_repository.dart';

class PartnerFirestoreRepository implements PartnerRepository {
  var provider = PartnerFirestoreProvider();

  @override
  Stream<T> partners<T>() {
    return provider.partner() as Stream<T>;
  }
}
