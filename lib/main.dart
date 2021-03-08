import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wagr/service_locator.dart';
import 'package:wagr/ui/library/screens/celebration_screen/celebration_screen.dart';
import 'package:wagr/ui/library/screens/home_screen/home_screen.dart';

void main() {
  setupLocator();
  runApp(WagrApp());
}

class WagrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wagr, sports betting for everyone',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }
        if (settings.name == '/celebration-screen') {
          return PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1500),
              pageBuilder: (context, animation, animationTime) {
                return ListenableProvider(create: (context) => animation, child: CelebrationScreen());
              });
        }
        return MaterialPageRoute(builder: (context) => HomeScreen());
      },
    );
  }
}
