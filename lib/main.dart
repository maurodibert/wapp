import 'package:flutter/material.dart';
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
      routes: {
        '/': (context) => HomeScreen(),
        '/celebration': (context) => CelebrationScreen(),
      },
    );
  }
}
