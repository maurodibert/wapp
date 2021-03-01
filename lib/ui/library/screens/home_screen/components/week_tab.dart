import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/ui/library/screens/home_screen/components/day_tab.dart';

class WeekTab extends StatelessWidget {
  final DayTab dayTab;
  WeekTab({this.dayTab});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(dayTab.day.dayName, style: kP.copyWith(fontSize: 20)),
      ),
    );
  }
}
