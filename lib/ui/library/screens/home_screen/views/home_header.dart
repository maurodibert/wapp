import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
              child: Text('Games', style: kH1.copyWith(fontWeight: FontWeight.normal)),
            ),
            Container(
              height: 70,
              child: ListView.separated(
                  itemCount: model.week.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: index == 0
                          ? MaterialButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Today', style: kP),
                              ))
                          : index == 1
                              ? MaterialButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Tomorrow', style: kP),
                                  ))
                              : MaterialButton(
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(model.week[index].dayName, style: kP),
                                  )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
