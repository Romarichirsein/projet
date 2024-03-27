import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projet/Navbar%20du%20gestionnaire/deliveraccount.dart';
import 'package:projet/Navbar%20du%20gestionnaire/history.dart';
import 'package:projet/Navbar%20du%20gestionnaire/homeadmin.dart';
import 'package:projet/Navbar%20du%20gestionnaire/notification.dart';

class navbaradmin extends StatefulWidget {
  @override
  State<navbaradmin> createState() => _navbaradminState();
}

class _navbaradminState extends State<navbaradmin> {
  int _selectedIndex = 0; // Index initial
  final List<Widget> _pages = [
    MyCustomUI(),
    comptelivreur(),
    message(),
    Historycolis()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(164, 200, 230, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: const Color.fromRGBO(164, 200, 230, 1),
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue,
            padding: EdgeInsets.all(16),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.delivery_dining, text: 'deliver '),
              GButton(icon: Icons.notifications, text: 'notification'),
              GButton(icon: Icons.history, text: 'history'),
            ],
          ),
        ),
      ),
    );
  }
}
