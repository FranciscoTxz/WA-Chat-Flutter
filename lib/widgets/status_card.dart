import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
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
                    imageUrl:
                        "https://cdn.pixabay.com/photo/2017/01/25/17/35/picture-2008484_1280.png",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.red),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://preview.redd.it/satoru-gojo-reference-fanart-v0-e3zaq33rfn791.jpg?width=1080&crop=smart&auto=webp&s=3bdd2fbf44ed69231cdb671f2d43a8fa305a5a4a",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, color: Colors.red),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "Persona x",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*Container(
      margin: EdgeInsets.all(8.0),
      color: Colors.blueAccent,
      width: 150.0, // Ancho del item
      height: 150.0, // Alto del item
      child: Center(
          child: Text('Item $index', style: TextStyle(color: Colors.white))),
    ); }*/
