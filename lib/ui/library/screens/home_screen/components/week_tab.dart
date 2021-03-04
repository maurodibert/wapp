import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/models/day_tab_model.dart';

class WeekTab extends StatelessWidget {
  final DayTabModel dayTabModel;
  WeekTab({this.dayTabModel});

  @override
  Widget build(BuildContext context) {
    final selected = dayTabModel.selected;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
            dayTabModel.index == 0
                ? "Today"
                : dayTabModel.index == 1
                    ? "Tomorrow"
                    : dayTabModel.day.dayName,
            style: kP.copyWith(fontSize: 16, color: selected ? kOrangeLight : kOrange)),
      ),
    );
  }
}
