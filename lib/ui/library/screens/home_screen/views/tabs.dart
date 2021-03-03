import 'package:flutter/material.dart';
import 'package:wagr/ui/library/screens/home_screen/components/week_tab.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

Widget buildTabs(HomeViewModel model) {
  return Container(
    height: 60,
    color: Colors.white,
    child: TabBar(
      onTap: model.onDaySelected,
      controller: model.tabController,
      isScrollable: true,
      indicatorColor: Colors.black,
      tabs: model.tabs.map((dayTabModel) => WeekTab(dayTabModel: dayTabModel)).toList(),
    ),
  );
}
