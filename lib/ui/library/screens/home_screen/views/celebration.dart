import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
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
        height: size.height - kHeaderHeight - kTabBarHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kPurple, kPurple, kPurpleLight, kPurpleLight],
              stops: [0, 0.01, 1, 1]),
        ),
        // color: kPurpleLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(onPressed: model.togglePlay),
            Padding(
              padding: const EdgeInsets.all(48.0),
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
    // header
    AnimatedPositioned(
      top: model.isCelebrationVisible ? 0 : -2000,
      duration: Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      child: Container(
          width: size.width,
          height: kHeaderHeight + kTabBarHeight,
          color: Colors.orange,
          child: model.riveArtboard != null && model.isCelebrationVisible
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 100,
                    child: rive.Rive(
                      artboard: model.riveArtboard,
                    ),
                  ))
              : Container()),
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
