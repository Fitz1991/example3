import 'package:republic_on_volga/domain/filter/filter_receiver.dart';

class AllFilterReceiver implements FilterReceiver{
  @override
  Future<T> filter<T>() {
      print('Отфмльтровали все');
  }

}