import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key, required this.chats, required this.onPressed});

  Map<String, dynamic> chats;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: WidgetStatePropertyAll(Colors.black),
        elevation: WidgetStatePropertyAll(2),
        overlayColor: WidgetStatePropertyAll(Colors.grey),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        minimumSize: WidgetStatePropertyAll(Size(200, 45)),
        maximumSize: WidgetStatePropertyAll(Size(200, 75)),
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
                    Icon(Icons.error, color: Colors.red),
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
                  cambiar(chats['name']),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  cambiar(chats['messages'][chats['messages'].length - 1]
                      ['message']),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
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
                  style: TextStyle(fontSize: 10, color: Colors.grey),
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
                    color: Color(0xFFf0190a),
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

String cambiar(String texto) {
  return texto.length > 25 ? '${texto.substring(0, 25)}...' : texto;
}
