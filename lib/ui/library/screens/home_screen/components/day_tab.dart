import 'package:flutter/material.dart';
import 'package:wagr/core/models/day_model.dart';

class DayTab {
  const DayTab({this.day, this.selected, @required this.offsetFrom});
  final DayModel day;
  final bool selected;
  final double offsetFrom;

  DayTab copyWith(bool selected) => DayTab(
        day: day,
        selected: selected,
        offsetFrom: offsetFrom,
      );
}
