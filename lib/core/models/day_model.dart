import 'package:wagr/core/models/game_model.dart';

class DayModel {
  final String dayName;
  final DateTime dateTime;
  List<GameModel> games;

  DayModel({this.dayName, this.dateTime, this.games});
}
