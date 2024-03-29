import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:projet/Navbar%20du%20gestionnaire/deliveraccount.dart';
import 'package:projet/Navbar%20du%20gestionnaire/history.dart';
import 'package:projet/Navbar%20du%20gestionnaire/homeadmin.dart';
import 'package:projet/Navbar%20du%20gestionnaire/notification.dart';
import 'package:projet/navbarlivreur/historique.dart';
import 'package:projet/navbarlivreur/homelivreur.dart';

class navbarlivreur extends StatefulWidget {
  @override
  State<navbarlivreur> createState() => _navbarlivreurState();
}

class _navbarlivreurState extends State<navbarlivreur> {
  int _selectedIndex = 0; // Index initial
  final List<Widget> _pages = [livreur(), Historylivreur()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 194, 131, 49),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 194, 131, 49),
            activeColor: Colors.white,
            tabBackgroundColor: Colors.orange,
            padding: EdgeInsets.all(16),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.history, text: 'historique'),
            ],
          ),
        ),
      ),
    );
  }
}
