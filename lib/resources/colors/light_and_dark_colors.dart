// color_util.dart
import 'package:flutter/material.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';

class ColorUtil {
  static Color getSearchBarColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsPrime.greySearchBar
        : ColorsPrime.white;
  }
}
