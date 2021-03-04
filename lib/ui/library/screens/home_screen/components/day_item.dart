import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/models/day_model.dart';

class DayItem extends StatelessWidget {
  final DayModel day;
  final int index;
  final int todayGamesLength;
  const DayItem({@required this.day, @required this.index, @required this.todayGamesLength});

  @override
  Widget build(BuildContext context) {
    int finalIndex;

    if (index == 0) {
      finalIndex = 0;
    } else {
      finalIndex = todayGamesLength + 1;
    }

    return Container(
      height: kDayTitleHeight,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
            index == 0
                ? "Today"
                : index == finalIndex
                    ? "Tomorrow"
                    : day.dayName,
            style: kP.copyWith(
              fontSize: 24,
            )),
      ),
    );
  }
}
