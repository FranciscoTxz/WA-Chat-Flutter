import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';

/*class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/

class StatusCard extends StatefulWidget {
  final int index;

  const StatusCard({super.key, required this.index});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  late Map<String, dynamic> status = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/status_info.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      status = jsonData[widget.index];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: 180,
        child: Card(
          color: ColorsPrime.greyStatus,
          child: Center(
            child: CircularProgressIndicator(
              color: ColorsPrime.greenStatus,
            ),
          ),
        ),
      );
    }
    return SizedBox(
      width: 180,
      child: GestureDetector(
        onTap: () {
          print("Se tocó la tarjeta de ${status["nombre"]}");
        },
        child: Card(
          color: status["visto"] == 1
              ? ColorsPrime.greenStatus
              : ColorsPrime.greyStatus,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: status["foto"].toString(),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: status["pp"].toString(),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    status["nombre"] ?? "Persona X",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsPrime.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: ColorsPrime.blackShadow,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
