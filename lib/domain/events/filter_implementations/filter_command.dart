import 'package:republic_on_volga/domain/filter/command.dart';
import 'package:republic_on_volga/domain/filter/filter_receiver.dart';


class FilterCommand implements Command{
  FilterReceiver _filterReceiver;
  FilterCommand(this._filterReceiver);

  @override
  execute() {
      _filterReceiver.filter();
  }
}