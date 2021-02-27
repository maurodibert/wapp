import 'package:get_it/get_it.dart';
import 'package:wagr/core/services/games_api.dart';

final locator = GetIt.instance;

/// Initial setup for **dependency injection threw Get It**
void setupLocator() {
  locator.registerSingleton<GamesAPI>(GamesAPI());
}
