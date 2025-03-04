import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';
import 'package:simple_menu/resources/functions/correct_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.chats, required this.onPressed});

  final Map<String, dynamic> chats;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: WidgetStatePropertyAll(ColorsPrime.black),
        elevation: WidgetStatePropertyAll(2),
        overlayColor: WidgetStatePropertyAll(ColorsPrime.greyP),
        backgroundColor: WidgetStatePropertyAll(ColorsPrime.white),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
        maximumSize: WidgetStatePropertyAll(Size(double.infinity, 75)),
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
          //PP
          CircleAvatar(
            radius: 30,
            backgroundColor: ColorsPrime.greyP[300],
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: chats["profile_image"],
                  placeholder: (context, url) => SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: ColorsPrime.red),
                  fit: BoxFit.cover,
                ),
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
                  corregir(chats['name']),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorsPrime.black,
                  ),
                ),
                Text(
                  corregir(chats['messages'][chats['messages'].length - 1]
                      ['message']),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: ColorsPrime.black,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  DateFormat("hh:mm a").format(DateTime.parse(chats['messages']
                      [chats['messages'].length - 1]['timestamp'])),
                  style: TextStyle(fontSize: 10, color: ColorsPrime.grey),
                ),
              ),
              Visibility(
                visible: chats['messages'][chats['messages'].length - 1]
                            ['sent_by'] ==
                        0
                    ? true
                    : false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    Icons.circle_notifications,
                    size: 22,
                    color: ColorsPrime.notifIcon,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
