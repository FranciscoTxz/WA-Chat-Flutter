import 'package:flutter/material.dart';

class AppBarCustomScreenOne extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.camera_alt),
            iconSize: 30,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            iconSize: 34,
            color: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color(0xFF1C1C1C),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
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
            color: Colors.white,
            onPressed: () {},
          ),
          Spacer(),
        ],
      ),
      backgroundColor: Color(0xFF1C1C1C),
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
            color: Colors.white,
            onPressed: () {},
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            iconSize: 34,
            color: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color(0xFF1C1C1C),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
