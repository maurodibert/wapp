import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';

class DayItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text('day', style: kP.copyWith(fontSize: 24)),
      ),
    );
  }
}
