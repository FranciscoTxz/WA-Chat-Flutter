import 'dart:ui';

import 'package:flutter/material.dart';

abstract final class ColorsPrime {
  /// Completely invisible.
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteT = Color(0x4DFFFFFF);
  static const Color grey = Color(0xFF3D3D3D);
  static const Color grey2 = Color(0xFFA4A4A4);
  static const Color red = Color(0xFFf0190a);
  static const Color black = Color(0xFF000000);
  static const Color blackT = Color(0x4D000000);

  // Home Screen
  static const Color selectedItemColor = Color(0xFFf0190a);
  static const Color backGround = Color(0xFF0C0C0C);

  //Custom Elevated Button
  static const Color notifIcon = Color(0xFFf0190a);
  static const MaterialColor greyP = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      350: Color(
          0xFFD6D6D6), // only for raised button while pressed in light theme
      400: Color(0xFFBDBDBD),
      500: Color(_greyPrimaryValue),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424242),
      850: Color(0xFF303030), // only for background color in dark theme
      900: Color(0xFF212121),
    },
  );
  static const int _greyPrimaryValue = 0xFF9E9E9E;

  //Search Bar
  static const Color greySearchBar = Color(0xFF1A1A1A);
  static const Color greySearchBarText = Color(0xFF818181);

  // Status Card
  static const Color redStatus = Color(0xB2FF0000);
  static const Color greyStatus = Color(0xB23D3D3D);
  static const Color whiteStatus = Color(0xB2CBC9C9);
  static const Color blackShadow = Color(0xB2000000);

  //Extra colors
  static const Color greyBackGroundButtons = Color(0xFF1A1A1A);
}
