import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlidingContainer extends StatelessWidget {
  final double initialOffsetX;
  final double intervalStart;
  final double intervalEnd;
  final Color color;
  final double height;
  final Widget child;

  const SlidingContainer({
    Key key,
    @required this.initialOffsetX,
    @required this.intervalStart,
    @required this.intervalEnd,
    @required this.color,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animation = Provider.of<Animation<double>>(context, listen: false);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(initialOffsetX, 0),
            end: Offset(0, 0),
          ).animate(
            CurvedAnimation(curve: Interval(intervalStart, intervalEnd, curve: Curves.easeOutCubic), parent: animation),
          ),
          child: child,
        );
      },
      child: Container(height: height, color: color, child: child),
    );
  }
}
