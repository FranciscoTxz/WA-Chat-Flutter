import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';

import '../resources/colors/colors_prime.dart';

class AppBarCustomScreenOne extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarCustomScreenOne({super.key});

  @override
  State<AppBarCustomScreenOne> createState() => _AppBarCustomScreenOneState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarCustomScreenOneState extends State<AppBarCustomScreenOne> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            iconSize: 30,
            color: ColorUtil.getWhiteBlack(context),
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.camera_alt),
            iconSize: 30,
            color: ColorUtil.getWhiteBlack(context),
            onPressed: _openCamera,
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            iconSize: 34,
            color: ColorsPrime.red,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: ColorUtil.getBackGround(context),
    );
  }
}

class AppBarCustomScreenTwo extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            iconSize: 30,
            color: ColorUtil.getWhiteBlack(context),
            onPressed: () {},
          ),
          Spacer(),
        ],
      ),
      backgroundColor: ColorUtil.getBackGround(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBarCustomScreenThree extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            iconSize: 30,
            color: ColorUtil.getWhiteBlack(context),
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            iconSize: 34,
            color: ColorsPrime.red,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: ColorUtil.getBackGround(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
