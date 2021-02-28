import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/models/away_team_model.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/core/models/home_team_model.dart';
import 'package:wagr/ui/library/wagr_icons.dart';

class GameCard extends StatelessWidget {
  final HomeTeamModel homeTeam;
  final AwayTeamModel awayTeam;
  final GameModel game;

  const GameCard({
    Key key,
    @required this.homeTeam,
    @required this.awayTeam,
    @required this.game,
  }) : super(key: key);

  Widget _buildContent() {
    List<String> _splittedHomeTeamName = homeTeam.name.split(' ');
    List<String> _splittedAwayTeamName = awayTeam.teamName.split(' ');

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
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [kBottomMediumShadow]),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(kMediumRadius)),
            child: Row(
              children: [
                Container(
                  width: 10,
                  color: homeTeam.primary,
                ),
                Container(
                  width: 10,
                  color: homeTeam.secondary,
                ),
                Flexible(
                  child: Container(
                    color: Colors.white,
                    child: _buildContent(),
                  ),
                ),
                Container(
                  width: 10,
                  color: awayTeam.primaryColor,
                ),
                Container(
                  width: 10,
                  color: awayTeam.secondaryColor,
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
    );
  }
}
