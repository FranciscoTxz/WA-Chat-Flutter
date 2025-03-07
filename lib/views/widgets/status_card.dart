import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_menu/models/status_model.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';

class StatusCard extends StatelessWidget {
  const StatusCard(
      {super.key,
      required this.index,
      required this.stat,
      required this.onPressed});

  final int index;
  final StatusModel stat;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          color:
              stat.seen == 1 ? ColorsPrime.redStatus : ColorsPrime.greyStatus,
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
                      imageUrl: stat.photo,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: ColorsPrime.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorsPrime.greyP[300],
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: stat.pp,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: ColorsPrime.red),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    stat.name,
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
