import 'package:flutter/cupertino.dart';

Row popupCustomItem(String text, IconData icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text),
      Icon(
        icon,
        size: 18,
      )
    ],
  );
}
