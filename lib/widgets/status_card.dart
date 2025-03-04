import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';

class StatusCard extends StatelessWidget {
  StatusCard(
      {super.key,
      required this.index,
      required this.stats,
      required this.onPressed}) {
    _validateStats();
  }

  final int index;
  final List<dynamic> stats;
  final VoidCallback onPressed;

  Future<void> _validateStats() async {
    while (stats.isEmpty || index >= stats.length) {
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _validateStats(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: 180,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
            onTap: onPressed,
            child: Card(
              color: stats[index]["visto"] == 1
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
                          imageUrl: stats[index]["foto"]?.toString() ?? "",
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
                            imageUrl: stats[index]["pp"]?.toString() ?? "",
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
                        stats[index]["nombre"]?.toString() ?? "Persona X",
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
      },
    );
  }
}
