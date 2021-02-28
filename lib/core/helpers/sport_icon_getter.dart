import 'package:flutter/material.dart';
import 'package:wagr/ui/library/wagr_icons.dart';

IconData getSportIcon(String json) {
  IconData _icon;

  switch (json) {
    case 'SOCCER':
      _icon = WagrIcons.soccer_ball;
      break;
    case 'ICE_HOCKEY':
      _icon = WagrIcons.hockey_puck;
      break;
    case 'BASKETBALL':
      _icon = WagrIcons.basketball_ball;
      break;
    case 'FOOTBALL':
      _icon = WagrIcons.football_ball;
      break;
    default:
  }

  return _icon;
}
