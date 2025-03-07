import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/call_model.dart';

class CallViewModel extends ChangeNotifier {
  List<CallModel> _calls = [];

  List<CallModel> get calls => _calls;

  Future<void> loadCalls() async {
    try {
      String jsonString = await rootBundle.loadString('assets/call_info.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      _calls = jsonData.map((e) => CallModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error al cargar llamadas: $e");
      print("Error al cargar llamadas: $e");
    }
  }
}
