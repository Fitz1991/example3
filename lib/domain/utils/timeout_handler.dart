import 'package:republic_on_volga/data/resources.dart';

import '../../main.dart';

typedef DoAfterTimeout(String message);

handleTimeout<T>(Stream<T> stream,  DoAfterTimeout func){
  final start = DateTime.now().millisecondsSinceEpoch;
  log.v('with timeout $timeout $start');
  stream.timeout(timeout).handleError((err){
    log.e('timeout.catchError $err $timeout ms: ${DateTime.now().millisecondsSinceEpoch - start}');
    func(err.message);
  });
}