import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeViewModel model = Provider.of<HomeViewModel>(context);

    return Container(
      height: size.height * 0.25,
      width: size.width,
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
                // controller: model.horizontalController,
                itemCount: model.week.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: index == 0
                        ? MaterialButton(
                            onPressed: () {
                              model.verticalController.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Today', style: kP),
                            ))
                        : index == 1
                            ? MaterialButton(
                                onPressed: () {
                                  model.verticalController
                                      .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Tomorrow', style: kP),
                                ))
                            : MaterialButton(
                                onPressed: () {
                                  model.verticalController
                                      .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(model.week[index].dayName, style: kP),
                                )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
