import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  final Function(int) changeTab;
  const ChatScreen({super.key, required this.changeTab});

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
    String jsonString = await rootBundle.loadString('assets/info.json');
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 3.0, bottom: 3.0),
                  child: CustomElevatedButton(
                    chats: chats[index],
                    onPressed: () => onButtonPressed(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
