import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/widgets/add_status_card.dart';
import 'package:simple_menu/widgets/widgets.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  late List<dynamic> status = [];
  late List<dynamic> channels = [];

  @override
  void initState() {
    super.initState();
    loadJsons();
  }

  Future<void> loadJsons() async {
    String jsonString = await rootBundle.loadString('assets/status_info.json');
    String jsonStringChannels =
        await rootBundle.loadString('assets/channels.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    final List<dynamic> jsonDataChannels = json.decode(jsonStringChannels);
    setState(() {
      status = jsonData;
      channels = jsonDataChannels;
    });
  }

  void onButtonPressed(int index) {
    print("Se tocó la tarjeta de ${status[index]["nombre"]}");
  }

  void onButtonPressed2(int index) {
    print("Se tocó la tarjeta de ${channels[index]["nombre"]}");
  }

  void onButtonPressedUploadImage() {
    print("Se subiria imagen");
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
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: ColorUtil.getWhiteBlack(context),
            ),
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
                color: ColorUtil.getWhiteBlack(context)),
          ),
        ),
        //TODO NEWS
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: status.length + 1,
            itemBuilder: (context, index) {
              return index != 0
                  ? StatusCard(
                      index: index - 1,
                      onPressed: () => onButtonPressed(index - 1),
                      stats: status)
                  : AddStatusCard(
                      onPressed: () => onButtonPressedUploadImage(),
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
              color: ColorUtil.getWhiteBlack(context),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: channels.length,
            itemBuilder: (context, index) {
              return CustomElevatedButtonChannels(
                index: index,
                onPressed: () => onButtonPressed2(index),
                channel: channels[index],
              );
            },
          ),
        )
      ],
    );
  }
}
