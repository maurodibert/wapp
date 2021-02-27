import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List<GameModel> _games;
  List<GameModel> get games => _games;

  //
  // GENERAL STATE

  //
  // LIFE CYCLE - Initialization and disposing
  init() async {
    _games = await _api.fetchGames();
    notifyListeners();
  }
}
