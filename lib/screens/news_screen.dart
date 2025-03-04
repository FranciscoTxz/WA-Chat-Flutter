import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/widgets/widgets.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  late List<dynamic> status = [];

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/status_info.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      status = jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 12.0, top: 0.0, right: 12.0, bottom: 12.0),
          child: Text(
            "Novedades",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SearchBarCustom(),
        Padding(
          padding: const EdgeInsets.only(
              left: 12.0, top: 4.0, right: 12.0, bottom: 12.0),
          child: Text(
            "Estados",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ),
        //TODO NEWS
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Cambiar a horizontal
            itemCount: 10, // Número de items
            itemBuilder: (context, index) {
              return StatusCard(
                index: index,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 12.0, top: 12.0, right: 12.0, bottom: 12.0),
          child: Text(
            "Canales",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Cambiar a horizontal
            itemCount: 10, // Número de items
            itemBuilder: (context, index) {
              return StatusCard(index: index);
            },
          ),
        )
      ],
    );
  }
}
