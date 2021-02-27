import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wagr/service_locator.dart';
import 'package:wagr/ui/library/screens/home_screen/home_screen.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

void main() {
  setupLocator();
  runApp(WagrApp());
}

class WagrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wagr, sports betting for everyone',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}
