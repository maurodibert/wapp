import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wagr/core/helpers/week_creator.dart';
import 'package:wagr/core/models/day_model.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/core/services/games_api.dart';
import 'package:wagr/service_locator.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    init();
  }

  //
  // INJECTIONS
  GamesAPI _api = locator<GamesAPI>();

  //
  // GENERAL STATE
  List<GameModel> _games;
  List<GameModel> get games => _games;

  DateTime _today;
  DateTime get today => _today;
  List<DayModel> _week;
  List<DayModel> get week => _week;

  List<GlobalKey> _keys = [];
  List<GlobalKey> get keys => _keys;

  ScrollController _verticalController;
  ScrollController get verticalController => _verticalController;

  ScrollController _horizontalController;
  ScrollController get horizontalController => _horizontalController;

  //
  // LIFE CYCLE - Initialization and disposing
  init() async {
    _games = await _api.fetchGames();

    // week order
    _today = _games[0].date;
    _week = createWeek(_today);
    for (DayModel categoryDay in _week) {
      categoryDay.games = [];
      for (GameModel game in _games) {
        if (categoryDay.dateTime.day == game.date.day) {
          categoryDay.games.add(game);
        }
      }
    }

    // scrolling
    for (int i = 0; i < 7; i++) {
      GlobalKey _key = GlobalKey();
      _keys.add(_key);
    }

    // _controllers = LinkedScrollControllerGroup();
    // _verticalController = _controllers.addAndGet();
    // _horizontalController = _controllers.addAndGet();

    notifyListeners();
  }
}
