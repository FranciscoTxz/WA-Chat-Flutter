import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_menu/resources/functions/correct_text.dart';

import '../resources/colors/colors_prime.dart';

class CustomElevatedButtonChannels extends StatelessWidget {
  const CustomElevatedButtonChannels(
      {super.key,
      required this.index,
      required this.channel,
      required this.onPressed});

  final Map<String, dynamic> channel;
  final VoidCallback onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 3.0, bottom: 3.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shadowColor: WidgetStatePropertyAll(ColorsPrime.black),
          elevation: WidgetStatePropertyAll(2),
          overlayColor: WidgetStatePropertyAll(ColorsPrime.greyP),
          backgroundColor: WidgetStatePropertyAll(ColorsPrime.white),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 80)),
          maximumSize: WidgetStatePropertyAll(Size(double.infinity, 85)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //PP
            CircleAvatar(
              radius: 33,
              backgroundColor: ColorsPrime.greyP[300],
              child: ClipOval(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CachedNetworkImage(
                    imageUrl: channel['imagen_grupo'],
                    placeholder: (context, url) => SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: ColorsPrime.red),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text(
                            corregir(channel['nombre']),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: ColorsPrime.black,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          DateFormat("hh:mm a")
                              .format(DateTime.parse(channel["fecha"])),
                          style:
                              TextStyle(fontSize: 10, color: ColorsPrime.greyP),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      maxLines: 2,
                      channel['ultimo_mensaje'],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: ColorsPrime.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
