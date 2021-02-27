import 'package:intl/intl.dart';
import 'package:wagr/core/models/day_model.dart';

List<DayModel> createWeek(DateTime today) {
  List<DateTime> _list = [];
  List<DayModel> _finalList = [];

  for (int i = 0; i < 7; i++) {
    if (i == 0) {
      _list.add(DateTime(today.year, today.month, today.day, today.hour, today.minute));
    } else {
      _list.add(DateTime(today.year, today.month, today.day + i, today.hour, today.minute));
    }
  }

  for (DateTime day in _list) {
    _finalList.add(DayModel(
      dayName: DateFormat('EEEE').format(day),
      dateTime: day,
    ));
  }

  return _finalList;
}
