import 'package:flutter/material.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';

class AddStatusCard extends StatelessWidget {
  AddStatusCard({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          color: ColorUtil.getBackGroungCard(context),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorsPrime.greyP[300],
                        child: ClipOval(
                          child: Image.asset("assets/gojo.png"),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_circle,
                          color: ColorsPrime.red,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: SizedBox(
                    width: 120,
                    child: Text(
                      "Añadir estado",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
