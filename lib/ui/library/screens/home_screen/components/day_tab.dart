import 'package:wagr/core/models/day_model.dart';

class DayTab {
  const DayTab({this.day, this.selected});
  final DayModel day;
  final bool selected;

  DayTab copyWith(bool selected) => DayTab(day: day, selected: selected);
}
