import 'package:flutter/material.dart';
import 'package:wagr/core/helpers/color_converter.dart';
import 'package:wagr/core/models/away_team_model.dart';
import 'package:wagr/core/models/home_team_model.dart';

class GameModel {
  final int gameId;
  final String sport;
  final String gameDateTime;
  final String homeTeamKey;
  final Color homePrimaryColor;
  final Color homeSecondaryColor;
  final String awayTeamKey;
  final Color awayPrimaryColor;
  final Color awaySecondaryColor;
  final String spread;
  final HomeTeamModel homeTeam;
  final AwayTeamModel awayTeam;

  GameModel({
    this.gameId,
    this.sport,
    this.gameDateTime,
    this.homeTeamKey,
    this.homePrimaryColor,
    this.homeSecondaryColor,
    this.awayTeamKey,
    this.awayPrimaryColor,
    this.awaySecondaryColor,
    this.spread,
    this.homeTeam,
    this.awayTeam,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      gameId: json['gameId'],
      sport: json['sport'],
      gameDateTime: json['gameDateTime'],
      homeTeamKey: json['homeTeamKey'],
      homePrimaryColor: colorConvert(json['homePrimaryColor']),
      homeSecondaryColor: colorConvert(json['homeSecondaryColor']),
      awayTeamKey: json['awayTeamKey'],
      awayPrimaryColor: colorConvert(json['awayPrimaryColor']),
      awaySecondaryColor: colorConvert(json['awaySecondaryColor']),
      spread: json['spread'],
      homeTeam: HomeTeamModel.fromJson(json['homeTeam']),
      awayTeam: AwayTeamModel.fromJson(json['awayTeam']),
    );
  }
}
