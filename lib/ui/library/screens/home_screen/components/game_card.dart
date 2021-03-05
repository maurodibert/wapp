import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/models/away_team_model.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/core/models/home_team_model.dart';
import 'package:wagr/ui/library/screens/home_screen/home_viewmodel.dart';
import 'package:wagr/ui/library/wagr_icons.dart';

class GameCard extends StatelessWidget {
  final GameModel game;
  final HomeViewModel model;

  const GameCard({
    @required this.game,
    @required this.model,
  });

  Widget _buildContent(HomeTeamModel hTeam, AwayTeamModel aTeam) {
    List<String> _splittedHomeTeamName = hTeam.name.split(' ');
    List<String> _splittedAwayTeamName = aTeam.teamName.split(' ');

    return Row(children: [
      Expanded(
        flex: 4,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(game.spread),
                Text(_splittedHomeTeamName[0], style: kP),
                Text(_splittedHomeTeamName[1], style: kH3),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('vs')],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(game.spread),
                Text(_splittedAwayTeamName[0], style: kP),
                Text(_splittedAwayTeamName[1], style: kH3),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    HomeTeamModel hTeam = game.hTeam;
    AwayTeamModel aTeam = game.aTeam;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/celebration');
      },
      child: Container(
        height: kGameCardHeight,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [kBottomMediumShadow],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(kMediumRadius)),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        color: hTeam.primary,
                      ),
                      Container(
                        width: 10,
                        color: hTeam.secondary,
                      ),
                      Flexible(
                        child: Container(
                          color: Colors.white,
                          child: _buildContent(hTeam, aTeam),
                        ),
                      ),
                      Container(
                        width: 10,
                        color: aTeam.primaryColor,
                      ),
                      Container(
                        width: 10,
                        color: aTeam.secondaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              k8Vertical,
              Row(children: [
                Row(
                  children: [
                    Icon(
                      game.sport.icon,
                      size: 16,
                    ),
                    k8Horizontal,
                    Text(game.league)
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(DateFormat('jm').format(game.date)),
                    k8Horizontal,
                    Icon(
                      WagrIcons.clock,
                      size: 16,
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
