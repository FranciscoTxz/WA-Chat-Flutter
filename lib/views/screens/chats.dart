import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_menu/models/chats_model.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/viewmodel/chats_view_model.dart';
import 'package:simple_menu/views/widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void initState() {
    super.initState();
    Provider.of<ChatsViewModel>(context, listen: false).loadChats();
  }

  void onButtonPressed(ChatsModel chat) {
    print(chat.name);
  }

  @override
  Widget build(BuildContext context) {
    final chatsVM = Provider.of<ChatsViewModel>(context);
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
              chatsVM.chats.length,
              (index) => Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 3.0, bottom: 3.0),
                child: CustomElevatedButton(
                  chats: chatsVM.chats[index],
                  onPressed: () => onButtonPressed(chatsVM.chats[index]),
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
