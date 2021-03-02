import 'package:flutter/material.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/ui/library/screens/home_screen/components/game_card.dart';

class GameItem extends StatelessWidget {
  final GameModel game;

  const GameItem({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: const EdgeInsets.all(24.0), child: GameCard(game: game)),
    );
  }
}
