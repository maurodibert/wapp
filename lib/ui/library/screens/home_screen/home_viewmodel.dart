import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/helpers/week_creator.dart';
import 'package:wagr/core/models/day_model.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/core/services/games_api.dart';
import 'package:wagr/service_locator.dart';
import 'package:wagr/ui/library/screens/home_screen/components/day_games_item.dart';
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

  Offset _cardPosition;
  Offset get cardPosition => _cardPosition;

  //
  //
  //
  //
  // From video
  TabController _tabController;
  TabController get tabController => _tabController;
  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  List<DayTab> _tabs = [];
  List<DayTab> get tabs => _tabs;
  List<DayGamesItem> _items = [];
  List<DayGamesItem> get items => _items;
  double _offsetFrom = 0.0;

  //
  // LIFE CYCLE - Initialization and disposing
  init(TickerProvider ticker) async {
    _games = await _api.fetchGames();

    // week order
    _today = _games[0].date;
    _week = createWeek(_today);
    for (DayModel categoryDay in _week) {
      categoryDay.games = [];
      _items.add(DayGamesItem(day: categoryDay));
      for (GameModel game in _games) {
        if (categoryDay.dateTime.day == game.date.day) {
          categoryDay.games.add(game);
          _items.add(DayGamesItem(game: game));
        }
      }
    }

    // scrolling
    for (int i = 0; i < _week.length; i++) {
      if (i > 0) {
        _offsetFrom += _week[i - 1].games.length * kCardHeight;
      }
      _tabs.add(DayTab(
        day: _week[i],
        selected: i == 0,
        offsetFrom: kDayVerticalItemHeight * i + _offsetFrom,
      ));
    }

    _tabController = TabController(length: _week.length, vsync: ticker);

    notifyListeners();
    _offsetFrom = 0.0;
  }

  void onDaySelected(int index) {
    final selected = _tabs[index];
    for (int i = 0; i < _tabs.length; i++) {
      _tabs[i] = _tabs[i].copyWith(selected == tabs[i]);
    }

    scrollController.animateTo(selected.offsetFrom, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    notifyListeners();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
