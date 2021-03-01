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

  List<GlobalKey> _daysKeys = [];
  List<GlobalKey> get daysKeys => _daysKeys;
  List<Key> _gamesKeys = [];
  List<Key> get gamesKeys => _gamesKeys;
  List<Key> _onViewWidgetKeys = [];
  List<Key> get visibleWidgetsKeysgamesKeys => _onViewWidgetKeys;

  AutoScrollController _verticalController;
  AutoScrollController get verticalController => _verticalController;
  dynamic _verticalKey;
  dynamic get verticalKey => _verticalKey;

  // AutoScrollController _horizontalController;
  // AutoScrollController get horizontalController => _horizontalController;
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
      _daysKeys.add(_key);
    }

    _verticalController = AutoScrollController(axis: Axis.vertical);
    _verticalKey = RectGetter.createGlobalKey();

    // _horizontalController = ScrollController();

    notifyListeners();
  }

  GlobalKey generateKey(int indexForGetDay) {
    var _key = RectGetter.createGlobalKey();
    _gamesKeys.add(_key);
    // _gamesKeys[indexForGetDay] = _key;

    // _gamesKeys[indexForGetDay] = RectGetter.createGlobalKey();

    // get index from horizontal
    // threw comparing sth
    // for (DayModel day in _week[indexForGetDay]) {}
    return _key;
  }

  List<GlobalKey> getVisible(BuildContext context) {
    var rect = RectGetter.getRectFromKey(verticalKey);
    _onViewWidgetKeys = <GlobalKey>[];
    _gamesKeys.forEach((key) {
      var itemRect = RectGetter.getRectFromKey(key);
      if (itemRect != null && !(itemRect.top > rect.bottom || itemRect.bottom < rect.top)) {
        _onViewWidgetKeys.add(key);
      }
    });

    // final RenderBox renderBox = _onViewWidgetKeys[0]
    // LabeledGlobalKey _firstItem = _onViewWidgetKeys[0]['currentWidget']['child']['child']['game']['date'];
    return _onViewWidgetKeys;
  }

  // void getPosition(GlobalKey key) {
  //   RenderBox box = key.currentContext.findRenderObject();
  //   _cardPosition = box.localToGlobal(Offset.zero);
  // }
}
