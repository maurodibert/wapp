import 'package:flutter/material.dart';
import 'package:wagr/ui/library/screens/home_screen/components/day_item.dart';
import 'package:wagr/ui/library/screens/home_screen/components/game_card.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

Widget buildBody(HomeViewModel model) {
  return Expanded(
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
            return GameCard(game: item.game, model: model);
          }
        },
      ),
    ),
  );
}
