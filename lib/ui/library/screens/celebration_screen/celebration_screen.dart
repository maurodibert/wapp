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
  Artboard _riveArtboard;
  RiveAnimationController _podiumController;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animations/yeh.riv').then((data) async {
      final file = RiveFile();
      if (file.import(data)) {
        final artboard = file.mainArtboard;
        artboard.addController(_podiumController = SimpleAnimation('jump'));
        setState(() {
          _riveArtboard = artboard;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPurpleLight,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SlidingContainer(
                    color: kOrange,
                    initialOffsetX: -1,
                    intervalStart: 0.5,
                    intervalEnd: 1,
                  ),
                ),
                Expanded(
                  child: SlidingContainer(
                    color: kPurple,
                    initialOffsetX: 1,
                    intervalStart: 0,
                    intervalEnd: 0.5,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _podiumController.isActive;
                });
              },
              child: Rive(
                artboard: _riveArtboard,
              ),
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
