import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/resources/themes/theme_provider.dart';

import '../resources/colors/colors_prime.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
      child: SearchBar(
        elevation: WidgetStateProperty.all(3),
        trailing: <Widget>[
          Tooltip(
            message: 'Change brightness mode',
            child: IconButton(
              isSelected: Provider.of<ThemeProvider>(context).isDarkMode,
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleDarkMode();
              },
              icon: const Icon(
                Icons.wb_sunny_outlined,
                color: ColorsPrime.greySearchBarText,
              ),
              selectedIcon: const Icon(
                Icons.brightness_2_outlined,
                color: ColorsPrime.greySearchBarText,
              ),
            ),
          ),
        ],
        constraints: BoxConstraints(
          minHeight: 40,
          maxHeight: 60,
        ),
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        hintText: "Buscar",
        hintStyle: WidgetStateProperty.all(
            TextStyle(color: ColorsPrime.greySearchBarText)),
        leading: Icon(
          size: 27,
          Icons.search,
          color: ColorsPrime.greySearchBarText,
        ),
        backgroundColor:
            WidgetStateProperty.all(ColorUtil.getSearchBarColor(context)),
        textStyle: WidgetStateProperty.all(
            TextStyle(fontSize: 16, color: ColorUtil.getWhiteBlack(context))),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
