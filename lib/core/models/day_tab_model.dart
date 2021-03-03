import 'package:flutter/material.dart';
import 'package:wagr/core/models/day_model.dart';

class DayTabModel {
  const DayTabModel({
    @required this.index,
    @required this.day,
    @required this.selected,
    @required this.positionFrom,
    @required this.positionTo,
  });
  final int index;
  final DayModel day;
  final bool selected;
  final double positionFrom;
  final double positionTo;

  /// will copy the tab with updated selected propery specified
  DayTabModel copyWith(bool selected) => DayTabModel(
        index: index,
        day: day,
        selected: selected,
        positionFrom: positionFrom,
        positionTo: positionTo,
      );
}
