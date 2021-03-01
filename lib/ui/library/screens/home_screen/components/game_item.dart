import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';

class GameItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text('game', style: kP.copyWith(color: Colors.white, fontSize: 32)),
      ),
    );
  }
}
