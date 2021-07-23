import 'package:republic_on_volga/domain/filter/filter_receiver.dart';

class SearchFilterReceiver implements FilterReceiver{
  String text;

  SearchFilterReceiver(this.text);

  @override
  Future<T> filter<T>() {
    print('Ведем поиск... по $text');
  }
}