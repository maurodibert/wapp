import 'package:flutter/material.dart';
import 'package:wagr/core/helpers/sport_icon_getter.dart';
import 'package:wagr/ui/library/wagr_icons.dart';

class SportModel {
  final String name;
  final IconData icon;

  SportModel({
    this.name,
    this.icon,
  });

  factory SportModel.fromJson(String json) {
    IconData _icon = getSportIcon(json);

    return SportModel(
      name: json,
      icon: _icon,
    );
  }
}
