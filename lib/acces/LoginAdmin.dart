// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:projet/Navbar%20du%20gestionnaire/NavbarAdmin.dart';

class loginAdmin extends StatefulWidget {
  @override
  State<loginAdmin> createState() => _loginAdminState();
}

class _loginAdminState extends State<loginAdmin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _GestionnaireAddress;
  late String _Gestionnairepassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blueAccent,
          const Color.fromARGB(255, 59, 136, 199),
          Color.fromARGB(255, 243, 241, 241),
        ])),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Se connecter',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xFFEEEEEE)))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Email ou numero de telephone",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez saisir l\'adresse ';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _GestionnaireAddress = value!;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xFFEEEEEE)))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "mot de passe",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez saisir le mot de passe';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _Gestionnairepassword = value!;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.black),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (Content) {
                                        return navbaradmin();
                                      }),
                                    );

                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();
                                      // Ici, je vais pouvoir ajouter la logique pour creer les livreurs
                                      // Par exemple, envoi des données à un serveur, affichage des  livreurs, etc.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Gestionnaire  créée avec succès !')));
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "Se connecter",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
