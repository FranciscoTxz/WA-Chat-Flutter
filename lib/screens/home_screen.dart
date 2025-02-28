import 'package:flutter/material.dart';
import 'package:simple_menu/screens/screens.dart';
import 'package:simple_menu/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      appBar: _getAppBar(_selectedIndex),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          ChatScreen(changeTab: _onItemTapped),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFFf0190a),
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: 'Estados'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Llamadas'),
        ],
      ),
    );
  }
}
