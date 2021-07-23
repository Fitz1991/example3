import 'package:republic_on_volga/domain/filter/filter_receiver.dart';

class DateFilterReceiver implements FilterReceiver{
  List<DateTime> dateTimeRange;


  DateFilterReceiver(this.dateTimeRange);

  @override
  Future<T> filter<T>() async {
      print('Отфильтровали по дате от ${dateTimeRange[0].day} : до ${dateTimeRange[1].day}');
  }

}