import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

List<Widget> buildCelebration(HomeViewModel model, Size size) {
  List<Widget> _components = [
    // body
    AnimatedPositioned(
      top: model.isCelebrationVisible ? kHeaderHeight + kTabBarHeight : -2000,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceInOut,
      child: Container(
        width: size.width,
        height: size.height,
        color: kPurpleLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    ),
    // header
    AnimatedPositioned(
      top: model.isCelebrationVisible ? 0 : -2000,
      duration: Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      child: Container(
        width: size.width,
        height: kHeaderHeight + kTabBarHeight,
        color: kPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GestureDetector(
                  onTap: model.toggleCelebrationVisibility,
                  child: Icon(
                    Icons.arrow_upward,
                    color: kOrangeLight,
                    size: 24,
                  )),
            ),
          ],
        ),
      ),
    ),
    // divider
    Positioned(
      top: kHeaderHeight + kTabBarHeight - 2,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        width: size.width,
        height: model.isCelebrationVisible ? 2 : 0,
        color: kOrangeLight,
      ),
    ),
  ];

  return _components;
}
