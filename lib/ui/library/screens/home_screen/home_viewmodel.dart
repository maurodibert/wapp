import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wagr/core/constants.dart';
import 'package:wagr/core/helpers/week_creator.dart';
import 'package:wagr/core/models/day_model.dart';
import 'package:wagr/core/models/game_model.dart';
import 'package:wagr/core/services/games_api.dart';
import 'package:wagr/service_locator.dart';
import 'package:wagr/core/models/day_item_model.dart';
import 'package:wagr/core/models/day_tab_model.dart';

class HomeViewModel extends ChangeNotifier {
  //
  // INJECTIONS
  GamesAPI _api = locator<GamesAPI>();

  //
  // GENERAL STATE
  // fetching
  List<GameModel> _games;
  List<GameModel> get games => _games;

  DateTime _today;
  DateTime get today => _today;
  List<DayModel> _week;
  List<DayModel> get week => _week;

  // scrolling
  TabController _tabController;
  TabController get tabController => _tabController;
  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  List<DayTabModel> _tabs = [];
  List<DayTabModel> get tabs => _tabs;
  List<DayItemModel> _items = [];
  List<DayItemModel> get items => _items;
  double _offsetFrom = 0.0;
  double _offsetTo = 0.0;
  bool _listen = true;

  //
  // LIFE CYCLE - Initialization and disposing
  init(TickerProvider ticker) async {
    _games = await _api.fetchGames();

    // week order
    _today = _games[0].date;
    _week = createWeek(_today);
    for (DayModel day in _week) {
      day.games = [];
      _items.add(DayItemModel(day: day));
      for (GameModel game in _games) {
        if (day.dateTime.day == game.date.day) {
          day.games.add(game);
          _items.add(DayItemModel(game: game));
        }
      }
    }

    // synced scrolling
    for (int i = 0; i < _week.length; i++) {
      DayModel currentDay = _week[i];
      DayModel previousDay = i == 0 ? null : _week[i - 1];

      // calculate tabs' positions
      // if not in the first tab
      if (i > 0) {
        _offsetFrom += kDayTitleHeight + previousDay.games.length * kGameCardHeight;
      }

      // if not in the last tab
      if (i < _week.length - 1) {
        _offsetTo = _offsetFrom + kDayTitleHeight + currentDay.games.length * kGameCardHeight;
      } else {
        _offsetTo = double.infinity;
      }

      // first tab
      if (i == 0) {
        // offsetFrom is 0
        _offsetTo = kDayTitleHeight + currentDay.games.length * kGameCardHeight;
      }

      _tabs.add(
        DayTabModel(
          index: i,
          day: _week[i],
          // for selecting first tab default
          selected: i == 0,
          positionFrom: _offsetFrom,
          positionTo: _offsetTo,
        ),
      );
    }

    _tabController = TabController(length: _week.length, vsync: ticker);
    _scrollController.addListener(_onScrollListener);

    notifyListeners();

    /// reset once the tabs were created
    _offsetFrom = 0.0;
  }

  Future<void> onDaySelected(int index, {bool animationRequired = true}) async {
    final selected = _tabs[index];
    for (int i = 0; i < _tabs.length; i++) {
      _tabs[i] = _tabs[i].copyWith(selected == tabs[i]);
    }

    if (animationRequired) {
      _listen = false;
      await scrollController.animateTo(selected.positionFrom,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      _listen = true;
    }
    notifyListeners();
  }

  void _onScrollListener() {
    if (_listen) {
      for (int i = 0; i < _tabs.length; i++) {
        final tab = tabs[i];
        if (_scrollController.offset >= tab.positionFrom &&
            _scrollController.offset <= tab.positionTo &&
            !tab.selected) {
          onDaySelected(i, animationRequired: false);
          _tabController.animateTo(i);
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollListener);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
