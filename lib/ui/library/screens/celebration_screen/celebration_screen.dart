import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class CelebrationScreen extends StatefulWidget {
  const CelebrationScreen({Key key}) : super(key: key);
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
    return Scaffold(
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(
                artboard: _riveArtboard,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
