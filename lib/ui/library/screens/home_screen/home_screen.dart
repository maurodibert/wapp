import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel model = Provider.of<HomeViewModel>(context);
    return SafeArea(
      child: Scaffold(
          body: model.games != null
              ? ListView.separated(
                  itemCount: model.games.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(model.games[index].gameId.toString()),
                    );
                  })
              : Center(
                  child: Text('There are no games'),
                )),
    );
  }
}
