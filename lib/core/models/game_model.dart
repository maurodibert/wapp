import 'package:flutter/material.dart';
import 'package:wagr/core/helpers/color_converter.dart';
import 'package:wagr/core/helpers/underscore_remover.dart';
import 'package:wagr/core/models/away_team_model.dart';
import 'package:wagr/core/models/home_team_model.dart';
import 'package:wagr/core/models/sport_model.dart';

class GameModel {
  final int id;
  final SportModel sport;
  final DateTime date;
  final String league;
  final String homeTeamKey;
  final Color homePrimary;
  final Color homeSecondary;
  final String awayTeamKey;
  final Color awayPrimary;
  final Color awaySecondary;
  final String spread;
  final HomeTeamModel hTeam;
  final AwayTeamModel aTeam;

  GameModel({
    this.id,
    this.sport,
    this.date,
    this.league,
    this.homeTeamKey,
    this.homePrimary,
    this.homeSecondary,
    this.awayTeamKey,
    this.awayPrimary,
    this.awaySecondary,
    this.spread,
    this.hTeam,
    this.aTeam,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    String _league = removeUnderscore(json['league']);

    return GameModel(
      id: json['gameId'],
      sport: SportModel.fromJson(json['sport']),
      date: DateTime.parse(json['gameDatetime']),
      league: _league,
      homeTeamKey: json['homeTeamKey'],
      homePrimary: convertToColor(json['homePrimaryColor']),
      homeSecondary: convertToColor(json['homeSecondaryColor']),
      awayTeamKey: json['awayTeamKey'],
      awayPrimary: convertToColor(json['awayPrimaryColor']),
      awaySecondary: convertToColor(json['awaySecondaryColor']),
      spread: json['spread'] != null ? json['spread'] : "Odds pending",
      hTeam: HomeTeamModel.fromJson(json['homeTeam']),
      aTeam: AwayTeamModel.fromJson(json['awayTeam']),
    );
  }
}
