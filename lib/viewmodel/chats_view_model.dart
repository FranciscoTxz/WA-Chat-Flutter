import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/models/chats_model.dart';

class ChatsViewModel extends ChangeNotifier {
  List<ChatsModel> _chats = [];

  List<ChatsModel> get chats => _chats;

  Future<void> loadChats() async {
    try {
      String jsonString = await rootBundle.loadString('assets/chat_info.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      _chats = jsonData.map((e) => ChatsModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error al cargar llamadas: $e");
      print("Error al cargar llamadas: $e");
    }
  }
}
