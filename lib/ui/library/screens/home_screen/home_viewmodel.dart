import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
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

  List<GlobalKey> _keysVertical = [];
  List<GlobalKey> get keysVertical => _keysVertical;

  AutoScrollController _verticalController;
  AutoScrollController get verticalController => _verticalController;
  AutoScrollController _horizontalController;
  AutoScrollController get horizontalController => _horizontalController;
  Offset _cardPosition;
  Offset get cardPosition => _cardPosition;

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
      _keysVertical.add(_key);
    }

    _verticalController = AutoScrollController(
        // viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    // _horizontalController = ScrollController();

    notifyListeners();
  }

  // void getPosition(GlobalKey key) {
  //   RenderBox box = key.currentContext.findRenderObject();
  //   _cardPosition = box.localToGlobal(Offset.zero);
  // }
}
