import 'package:flutter/material.dart';
import 'package:wagr/core/models/day_model.dart';

class DayTabModel {
  const DayTabModel({
    @required this.index,
    @required this.day,
    @required this.selected,
    @required this.offsetFrom,
    @required this.offsetTo,
  });
  final int index;
  final DayModel day;
  final bool selected;
  final double offsetFrom;
  final double offsetTo;

  DayTabModel copyWith(bool selected) => DayTabModel(
        index: index,
        day: day,
        selected: selected,
        offsetFrom: offsetFrom,
        offsetTo: offsetTo,
      );
}
