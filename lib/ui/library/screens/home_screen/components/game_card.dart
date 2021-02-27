import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/models/away_team_model.dart';
import 'package:wagr/core/models/home_team_model.dart';

class GameCard extends StatelessWidget {
  final HomeTeamModel homeTeam;
  final AwayTeamModel awayTeam;

  const GameCard({
    Key key,
    @required this.homeTeam,
    @required this.awayTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [kBottomMediumShadow]),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(kMediumRadius)),
        child: Row(
          children: [
            Container(
              width: 10,
              color: homeTeam.primaryColor,
            ),
            Container(
              width: 10,
              color: homeTeam.secondaryColor,
            ),
            Flexible(
              child: Container(
                color: Colors.white,
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
    );
  }
}
