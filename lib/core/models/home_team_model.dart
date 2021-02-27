import 'package:flutter/material.dart';
import 'package:wagr/core/helpers/color_converter.dart';

class HomeTeamModel {
  final int teamId;
  final String teamName;
  final String city;
  final String teamKey;
  final Color primaryColor;
  final Color secondaryColor;

  HomeTeamModel({
    this.teamId,
    this.teamName,
    this.city,
    this.teamKey,
    this.primaryColor,
    this.secondaryColor,
  });

  factory HomeTeamModel.fromJson(Map<String, dynamic> json) {
    return HomeTeamModel(
      teamId: json['teamId'],
      teamName: json['teamName'],
      city: json['city'],
      teamKey: json['teamKey'],
      primaryColor: convertToColor(json['primaryColor']),
      secondaryColor: convertToColor(json['secondaryColor']),
    );
  }
}
