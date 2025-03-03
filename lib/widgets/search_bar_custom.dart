import 'package:flutter/material.dart';

import '../resources/colors/colors_prime.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
      child: SearchBar(
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
        backgroundColor: WidgetStateProperty.all(ColorsPrime.greySearchBar),
        textStyle: WidgetStateProperty.all(
            TextStyle(fontSize: 16, color: ColorsPrime.white)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
