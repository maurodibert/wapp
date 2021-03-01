import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:wagr/core/helpers/week_creator.dart';
import 'package:wagr/core/models/day_model.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/core/services/games_api.dart';
import 'package:wagr/service_locator.dart';
import 'package:wagr/ui/library/screens/home_screen/components/day_tab.dart';

class HomeViewModel extends ChangeNotifier {
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

  List<GlobalKey> _daysKeys = [];
  List<GlobalKey> get daysKeys => _daysKeys;
  List<Key> _gamesKeys = [];
  List<Key> get gamesKeys => _gamesKeys;
  List<Key> _onViewWidgetKeys = [];
  List<Key> get visibleWidgetsKeysgamesKeys => _onViewWidgetKeys;

  Offset _cardPosition;
  Offset get cardPosition => _cardPosition;

  //
  //
  //
  //
  // From video
  TabController _tabController;
  TabController get tabController => _tabController;
  List<DayTab> _tabs = [];
  List<DayTab> get tabs => _tabs;

  //
  // LIFE CYCLE - Initialization and disposing
  init(TickerProvider ticker) async {
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
    for (int i = 0; i < _week.length; i++) {
      _tabs.add(DayTab(day: _week[i], selected: i == 0));
    }

    _tabController = TabController(length: _week.length, vsync: ticker);

    notifyListeners();
  }
}
