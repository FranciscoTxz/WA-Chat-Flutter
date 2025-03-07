// color_util.dart
import 'package:flutter/material.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';

class ColorUtil {
  static Color getSearchBarColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.greySearchBar
        : ColorsPrime.greySearchBarBack;
  }

  static Color getNavigationBar(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.black
        : ColorsPrime.white;
  }

  static Color getWhiteBlack(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.white
        : ColorsPrime.black;
  }

  static Color getBlackWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.black
        : ColorsPrime.white;
  }

  static Color getBackGround(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.backGround
        : ColorsPrime.white;
  }

  static Color getBackGroundButtons(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.greyBackGroundButtons
        : ColorsPrime.greySearchBarBack;
  }

  static Color getDateTextButtons(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.white
        : ColorsPrime.grey;
  }

  static Color getBackGroungCard(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.greyStatus
        : ColorsPrime.whiteStatus;
  }

  static Color getColorStatusCall(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.greyStatus
        : ColorsPrime.grey;
  }
}
