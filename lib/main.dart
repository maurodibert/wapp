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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _mycontroller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Scaffold(
        body: Container(
            height: 100,
            child: Stack(children: <Widget>[
              SingleChildScrollView(
                  controller: _mycontroller,
                  child: Column(
                    children: <Widget>[
                      Text('LEFT            '),
                      Text('LEFT            '),
                      Text('LEFT            '),
                      Text('LEFT            '),
                      Text('LEFT            '),
                      Text('LEFT            '),
                    ],
                  )),
              SingleChildScrollView(
                  controller: _mycontroller,
                  child: Column(
                    children: <Widget>[
                      Text('          RIGHT'),
                      Text('          RIGHT'),
                      Text('          RIGHT'),
                      Text('          RIGHT'),
                      Text('          RIGHT'),
                      Text('          RIGHT'),
                    ],
                  )),
            ])));
  }
}
