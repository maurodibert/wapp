import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wagr/core/models/game_model.dart';

class GamesAPI extends ChangeNotifier {
  /// Get **list of games**
  Future<List<GameModel>> fetchGames() async {
    List<GameModel> _games = [];
    String url = 'https://us-central1-wagr-develop.cloudfunctions.net/code-challenge-mobile-app-games';

    try {
      print('[ GamesAPI ] Fetching games');
      var response = await http.get(url);

      if (response.statusCode == 404) {
        print('[ GamesAPI ] There are no more games');
        return _games;
      } else {
        final List decodedBody = await json.decode(response.body) as List;
        if (decodedBody != null) {
          for (var game in decodedBody) {
            _games.add(GameModel.fromJson(game));
          }
        }

        print('[ GamesAPI ] Fetching games ended');
        return _games;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
