import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';

Widget buildHeader() {
  return Container(
    color: kPurple,
    height: 100,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 0, 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Games', style: kH1.copyWith(fontWeight: FontWeight.normal, color: kOrangeLight, fontFamily: 'Raleway')),
        ],
      ),
    ),
  );
}
