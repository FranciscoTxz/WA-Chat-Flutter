import 'package:flutter/material.dart';
import 'package:simple_menu/resources/colors/colors_prime.dart';
import 'package:simple_menu/screens/screens.dart';
import 'package:simple_menu/widgets/widgets.dart';

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
        return AppBarCustomScreenOne();
      case 1:
        return AppBarCustomScreenTwo();
      case 2:
        return AppBarCustomScreenThree();
      default:
        return AppBarCustomScreenOne();
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
      backgroundColor: ColorsPrime.backGround,
      appBar: _getAppBar(_selectedIndex),
      body: _getScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: ColorsPrime.selectedItemColor,
        unselectedItemColor: ColorsPrime.white,
        backgroundColor: ColorsPrime.black,
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
