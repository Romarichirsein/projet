import 'package:flutter/material.dart';

class message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Center(
        child: Text(
          'Aucune notification signalée',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
