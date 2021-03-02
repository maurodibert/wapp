import 'package:wagr/core/models/day_model.dart';
import 'package:wagr/core/models/game_model.dart';

class DayInVerticalScrollItem {
  const DayInVerticalScrollItem({this.day, this.game});
  final DayModel day;
  final GameModel game;
  bool get isDay => day != null;
}
