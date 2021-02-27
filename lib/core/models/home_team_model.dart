import 'package:flutter/material.dart';
import 'package:wagr/core/helpers/color_converter.dart';

class HomeTeamModel {
  final int teamId;
  final String teamName;
  final String city;
  final String teamKey;
  final Color primaryColor;
  final Color secondarColor;

  HomeTeamModel({
    this.teamId,
    this.teamName,
    this.city,
    this.teamKey,
    this.primaryColor,
    this.secondarColor,
  });

  factory HomeTeamModel.fromJson(Map<String, dynamic> json) {
    return HomeTeamModel(
      teamId: json['teamId'],
      teamName: json['teamName'],
      city: json['city'],
      teamKey: json['teamKey'],
      primaryColor: colorConvert(json['primaryColor']),
      secondarColor: colorConvert(json['secondaryColor']),
    );
  }
}
