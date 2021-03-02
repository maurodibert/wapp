import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/ui/library/screens/home_screen/components/day_item.dart';
import 'package:wagr/ui/library/screens/home_screen/components/game_item.dart';
import 'package:wagr/ui/library/screens/home_screen/components/week_tab.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
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
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Colors.white,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Games', style: kH1.copyWith(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: TabBar(
                          onTap: model.onDaySelected,
                          controller: model.tabController,
                          isScrollable: true,
                          tabs: model.tabs.map((dayTabModel) => WeekTab(dayTabModel: dayTabModel)).toList(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            controller: model.scrollController,
                            itemCount: model.items.length,
                            itemBuilder: (context, index) {
                              final item = model.items[index];
                              // to get 'Tomorrow'
                              final int todayGamesLength = model.week[0].games.length;

                              if (item.isDay) {
                                return DayItem(
                                  day: item.day,
                                  index: index,
                                  todayGamesLength: todayGamesLength,
                                );
                              } else {
                                return GameItem(game: item.game);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
      )),
    );
  }
}
