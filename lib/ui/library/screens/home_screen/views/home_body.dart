import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/models/day_model.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/ui/library/screens/home_screen/components/game_card.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeViewModel model = Provider.of<HomeViewModel>(context);

    return Container(
      height: size.height * 0.719,
      width: size.width,
      child: SingleChildScrollView(
        controller: model.verticalController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < model.week.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: i == 0
                        ? AutoScrollTag(
                            key: model.keysVertical[0],
                            controller: model.verticalController,
                            index: i,
                            highlightColor: Colors.red.withOpacity(0.2),
                            child: Text('Today', style: kP.copyWith(fontSize: 24)))
                        : i == 1
                            ? AutoScrollTag(
                                key: model.keysVertical[1],
                                controller: model.verticalController,
                                index: i,
                                highlightColor: Colors.red.withOpacity(0.2),
                                child: Text('Tomorrow', style: kP.copyWith(fontSize: 24)))
                            : AutoScrollTag(
                                key: model.keysVertical[i],
                                controller: model.verticalController,
                                index: i,
                                highlightColor: Colors.red.withOpacity(0.2),
                                child: Text(model.week[i].dayName, style: kP.copyWith(fontSize: 24))),
                  ),
                  for (GameModel game in model.week[i].games)
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: GameCard(
                        homeTeam: game.hTeam,
                        awayTeam: game.aTeam,
                        game: game,
                      ),
                    )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
