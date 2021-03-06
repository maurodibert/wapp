import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';
import 'package:wagr/ui/library/screens/home_screen/views/body.dart';
import 'package:wagr/ui/library/screens/home_screen/views/header.dart';
import 'package:wagr/ui/library/screens/home_screen/views/tabs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final model = HomeViewModel();

  @override
  void initState() {
    model.init(this);
    super.initState();
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
        child: AnimatedBuilder(
            animation: model,
            builder: (_, __) => model.games != null
                ? Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildHeader(),
                        buildTabs(model),
                        buildBody(model),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: kOrangeLight,
                      strokeWidth: 16,
                      valueColor: AlwaysStoppedAnimation<Color>(kPurple),
                    ),
                  )),
      )),
    );
  }
}
