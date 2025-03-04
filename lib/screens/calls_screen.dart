import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';
import 'package:simple_menu/widgets/widgets.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  List<dynamic> calls = [];

  void initState() {
    super.initState();
    loadJson();
  }

  void onButtonPressed(int index) {
    print(calls[index]['name']);
  }

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/call_info.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      calls = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, top: 0.0, right: 12.0, bottom: 12.0),
            child: Text(
              "Llamadas",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorsPrime.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 12.0, top: 0.0, right: 12.0, bottom: 12.0),
            child: Text(
              "Recientes",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsPrime.white),
            ),
          ),
          Column(
            children: List.generate(
              calls.length,
              (index) => Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 3.0, bottom: 3.0),
                child: CustomButtonCall(
                  callInfo: calls[index],
                  onPressed: () => onButtonPressed(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
