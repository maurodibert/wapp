import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/ui/library/screens/celebration_screen/components/sliding_container.dart';

class CelebrationScreen extends StatefulWidget {
  final Animation<double> transitionAnimation;

  const CelebrationScreen({Key key, this.transitionAnimation}) : super(key: key);
  @override
  _CelebrationPageState createState() => _CelebrationPageState();
}

class _CelebrationPageState extends State<CelebrationScreen> {
  void _togglePlay() {
    setState(() => _podiumController.isActive = !_podiumController.isActive);
  }

  bool get isPlaying => _podiumController?.isActive ?? false;

  Artboard _riveArtboard;
  RiveAnimationController _podiumController;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animations/wagr.riv').then((data) async {
      final file = RiveFile();
      if (file.import(data)) {
        final artboard = file.mainArtboard;
        artboard.addController(_podiumController = SimpleAnimation('wagr'));
        setState(() => _riveArtboard = artboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            SlidingContainer(
              color: kPurple,
              initialOffsetX: 1,
              intervalStart: 0,
              intervalEnd: 0.5,
              height: kHeaderHeight + kTabBarHeight,
            ),
            SlidingContainer(
              height: size.height - kHeaderHeight - kTabBarHeight,
              color: kOrange,
              initialOffsetX: -1,
              intervalStart: 0.5,
              intervalEnd: 1,
            ),
          ],
        ),
      ),

      // body: Center(
      //   child: _riveArtboard == null
      //       ? const SizedBox()
      //       : Rive(
      //           artboard: _riveArtboard,
      //         ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _togglePlay,
      //   tooltip: isPlaying ? 'Pause' : 'Play',
      //   child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      // ),
    );
  }
}
