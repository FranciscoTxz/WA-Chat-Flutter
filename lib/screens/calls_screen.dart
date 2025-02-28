import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Mi Lista de Elementos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: List.generate(
              50,
              (index) => ListTile(
                title: Text("Elemento $index"),
                leading: Icon(Icons.star),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
