import 'package:flutter/material.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/views/screens/screens.dart';
import 'package:simple_menu/views/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return ChatScreen();
      case 1:
        return StatusScreen();
      case 2:
        return CallsScreen();
      default:
        return ChatScreen();
    }
  }

  PreferredSizeWidget _getAppBar(int index) {
    switch (index) {
      case 0:
        return AppBarCustom(menuIndex: 0);
      case 1:
        return AppBarCustom(
          menuIndex: 1,
        );
      case 2:
        return AppBarCustom(
          menuIndex: 2,
        );
      default:
        return AppBarCustom(
          menuIndex: 0,
        );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.getBackGround(context),
      appBar: _getAppBar(_selectedIndex),
      body: _getScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: ColorsPrime.selectedItemColor,
        unselectedItemColor: ColorUtil.getWhiteBlack(context),
        backgroundColor: ColorUtil.getNavigationBar(context),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded), label: 'Novedades'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Llamadas'),
        ],
      ),
    );
  }
}
