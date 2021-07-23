import 'package:republic_on_volga/data/event_page/provider/event_firestore_provider.dart';

import 'event_repository.dart';

class EventFirestoreRepository implements EventRepository {
  var provider = EventFirestoreProvider();
  @override
  Stream<T> events<T>() {
    return provider.event() as Stream<T>;
  }
}
