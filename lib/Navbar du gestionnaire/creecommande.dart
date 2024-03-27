// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _customerName;
  late String _customertel;
  late String _customerAddress;
  late String _itemDescription;
  late int _quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer une nouvelle commande"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom du client'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir le nom du client';
                  }
                  return null;
                },
                onSaved: (value) {
                  _customerName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'tel client'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir le numero de telephone du client';
                  }
                  return null;
                },
                onSaved: (value) {
                  _customertel = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Adresse livraison du client'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir l\'adresse du client';
                  }
                  return null;
                },
                onSaved: (value) {
                  _customerAddress = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Description de la commande'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir la description de la commande';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemDescription = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantité'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir la quantité';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quantity = int.parse(value!);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // Ici, vous pouvez ajouter la logique pour traiter la commande et lancer le dispatching des courses
                      // Par exemple, envoi des données à un serveur, notification aux livreurs, etc.
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Commande créée avec succès !')));
                    }
                  },
                  child: Text('Créer la commande'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
