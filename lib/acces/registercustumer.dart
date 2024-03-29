import 'package:flutter/material.dart';

import 'package:projet/acces/LoginCustomer.dart';

class Registercustomer extends StatefulWidget {
  @override
  State<Registercustomer> createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<Registercustomer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _customername;
  late String _customerAddress;
  late String _customerpassword;
  late String _customerrephone;

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
          Colors.deepPurple,
          Colors.purple,
          Colors.white,
        ])),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "s'inscrire",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
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
                                    color: Colors.purple,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFEEEEEE),
                                    ),
                                  ),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Nom",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez saisir le nom ';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _customername = value!;
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
                                    hintText: "E-mail",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez saisir l\'adresse ';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _customerAddress = value!;
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
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez saisir le mot de passe';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _customerpassword = value!;
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
                                    hintText: "numero de telephone",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Veuillez saisir le numero ';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _customerrephone = value!;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.deepPurple,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (Content) {
                                      return logincustomer();
                                    }));

                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();
                                      // Ici, je vais pouvoir ajouter la logique pour creer les livreurs
                                      // Par exemple, envoi des données à un serveur, affichage des  livreurs, etc.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'client  créée avec succès !')));
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "S'inscrire",
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
                              Text(
                                "avez vous deja un compte?",
                                style: TextStyle(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (Content) {
                                        return logincustomer();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  'Se connecter',
                                  style: TextStyle(color: Colors.purple),
                                ),
                              )
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
