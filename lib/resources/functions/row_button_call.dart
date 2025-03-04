import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/colors_prime.dart';

Row dataChange(int type) {
  switch (type) {
    case 0:
      return Row(
        children: [
          Icon(
            Icons.phone_callback_rounded,
            size: 20,
            color: ColorsPrime.grey2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "Enrante",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: ColorsPrime.grey2,
              ),
            ),
          ),
        ],
      );
    case 1:
      return Row(
        children: [
          Icon(
            Icons.call_rounded,
            size: 20,
            color: ColorsPrime.grey2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "Saliente",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: ColorsPrime.grey2,
              ),
            ),
          ),
        ],
      );
    case 2:
      return Row(
        children: [
          Icon(
            Icons.call_missed_rounded,
            size: 20,
            color: ColorsPrime.grey2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "Perdida",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: ColorsPrime.grey2,
              ),
            ),
          ),
        ],
      );
    default:
      return Row(
        children: [
          Icon(
            Icons.call_rounded,
            size: 20,
            color: ColorsPrime.grey2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "Saliente",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: ColorsPrime.grey2,
              ),
            ),
          ),
        ],
      );
  }
}
