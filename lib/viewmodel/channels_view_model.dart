import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/models/channels_model.dart';

class ChannelsViewModel extends ChangeNotifier {
  List<ChannelsModel> _channels = [];

  List<ChannelsModel> get channels => _channels;

  Future<void> loadChannels() async {
    try {
      String jsonString = await rootBundle.loadString('assets/channels.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      _channels = jsonData.map((e) => ChannelsModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error al cargar llamadas: $e");
      print("Error al cargar llamadas: $e");
    }
  }
}
