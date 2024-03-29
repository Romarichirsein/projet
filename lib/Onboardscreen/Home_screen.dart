import 'package:flutter/material.dart';
import 'package:projet/acces/registerAdmin.dart';
import 'package:projet/acces/registercustumer.dart';
import 'package:projet/acces/Login%20deliver.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Voulez-vous créer un compte ?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (Content) {
                  return Registercustomer();
                }));
              },
              child: Text('Client'),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (Content) {
                  return RegisterAdmin();
                }));
              },
              child: Text('Gestionnaire'),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (Content) {
                        return Signupdeliver();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Se connecter à mon compte  ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Livreur",
                        style: TextStyle(
                            color: Colors.red), // Exemple de style différent
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
