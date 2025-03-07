import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_menu/models/call_model.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';
import 'package:simple_menu/views/widgets/widgets.dart';
import 'package:simple_menu/resources/functions/correct_text.dart';
import '../../resources/colors/light_and_dark_colors.dart';

class CustomButtonCall extends StatelessWidget {
  const CustomButtonCall(
      {super.key, required this.callInfo, required this.onPressed});

  final CallModel callInfo;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: WidgetStatePropertyAll(ColorsPrime.black),
        elevation: WidgetStatePropertyAll(2),
        overlayColor: WidgetStatePropertyAll(ColorsPrime.grey),
        backgroundColor:
            WidgetStatePropertyAll(ColorUtil.getBackGroundButtons(context)),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        maximumSize: WidgetStatePropertyAll(Size(double.infinity, 60)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: ColorsPrime.greyP[300],
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: callInfo.image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: ColorsPrime.red),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  corregir(callInfo.name),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: callInfo.type != 2
                        ? FontWeight.normal
                        : FontWeight.bold,
                    color: callInfo.type != 2
                        ? ColorUtil.getWhiteBlack(context)
                        : ColorsPrime.red,
                  ),
                ),
                dataChange(callInfo.type)
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: Text(
              DateFormat("hh:mm a").format(DateTime.parse(callInfo.date)),
              style: TextStyle(
                  fontSize: 10, color: ColorUtil.getDateTextButtons(context)),
            ),
          ),
          IconButton(
            iconSize: 23,
            color: ColorUtil.getWhiteBlack(context),
            onPressed: () {},
            icon: Icon(Icons.info_outline_rounded),
          )
        ],
      ),
    );
  }
}
