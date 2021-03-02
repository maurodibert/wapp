import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/models/day_model.dart';

class DayItem extends StatelessWidget {
  final DayModel day;

  const DayItem({Key key, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(day.dayName, style: kP.copyWith(fontSize: 24)),
      ),
    );
  }
}
