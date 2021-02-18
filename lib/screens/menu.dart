import 'package:flutter/material.dart';

import '../screens/logout.dart';
import '../const.dart';
import './menu_list.dart';

class MenuScreen extends StatefulWidget {
  static String routeName = 'menuScreen';
  static Route<MenuScreen> route() {
    return MaterialPageRoute<MenuScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => MenuScreen(),
    );
  }

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Menu"),
        centerTitle: false,
        actions: [
          Image.asset(
            "assets/logo.png",
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
      body: _selectedIndex == 3 ? LogoutScreen() : MenuList(coffees: coffees),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.brown.shade300,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.local_drink), label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown.shade800,
        onTap: _onItemTapped,
      ),
    );
  }
}
