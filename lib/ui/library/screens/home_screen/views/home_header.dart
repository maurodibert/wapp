import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeViewModel model = Provider.of<HomeViewModel>(context);

    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Container(
        height: size.height * 0.25,
        width: size.width,
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 0, 20),
              child: Text('Games', style: kH1),
            ),
            Container(
              height: 40,
              child: ListView.separated(
                  itemCount: model.games.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: Text(model.games[index].gameId.toString()),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
