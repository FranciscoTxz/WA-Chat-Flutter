import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/views/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<dynamic> chats = [];

  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/new_info.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      chats = jsonData;
    });
  }

  void onButtonPressed(int index) {
    print(chats[index]['name']);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, top: 0.0, right: 12.0, bottom: 12.0),
            child: Text(
              "Chats",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorUtil.getWhiteBlack(context)),
            ),
          ),
          SearchBarCustom(),
          Column(
            children: List.generate(
              chats.length,
              (index) => Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 3.0, bottom: 3.0),
                child: CustomElevatedButton(
                  chats: chats[index],
                  onPressed: () => onButtonPressed(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    //);
  }
}
