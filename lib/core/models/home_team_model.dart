import 'package:flutter/material.dart';
import 'package:wagr/core/helpers/color_converter.dart';

class HomeTeamModel {
  final int id;
  final String name;
  final String city;
  final String teamKey;
  final Color primary;
  final Color secondary;

  HomeTeamModel({
    this.id,
    this.name,
    this.city,
    this.teamKey,
    this.primary,
    this.secondary,
  });

  factory HomeTeamModel.fromJson(Map<String, dynamic> json) {
    return HomeTeamModel(
      id: json['teamId'],
      name: json['teamName'],
      city: json['city'],
      teamKey: json['teamKey'],
      primary: convertToColor(json['primaryColor']),
      secondary: convertToColor(json['secondaryColor']),
    );
  }
}
