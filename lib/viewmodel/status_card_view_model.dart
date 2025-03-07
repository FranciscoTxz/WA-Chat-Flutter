import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/models/status_model.dart';

class StatusViewModel extends ChangeNotifier {
  List<StatusModel> _status = [];

  List<StatusModel> get status => _status;

  Future<void> loadStatus() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/status_info.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      _status = jsonData.map((e) => StatusModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error al cargar llamadas: $e");
      print("Error al cargar llamadas: $e");
    }
  }
}
