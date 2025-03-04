import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_menu/resources/functions/correct_text.dart';

class CustomElevatedButtonChannels extends StatelessWidget {
  const CustomElevatedButtonChannels(
      {super.key, required this.chats, required this.onPressed});

  final Map<String, dynamic> chats;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: WidgetStatePropertyAll(Colors.black),
        elevation: WidgetStatePropertyAll(2),
        overlayColor: WidgetStatePropertyAll(Colors.grey),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
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
            backgroundColor: Colors.grey[300],
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: chats['profile_image'],
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
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
                  corregir(chats['name']),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  corregir(chats['messages'][chats['messages'].length - 1]
                      ['message']),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
