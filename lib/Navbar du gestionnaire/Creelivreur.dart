// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class DeliverForm extends StatefulWidget {
  @override
  _DeliverFormState createState() => _DeliverFormState();
}

class _DeliverFormState extends State<DeliverForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _DeliverName;
  late String _DeliverAddress;
  late int _phonedeliver;
  late String _vehiculedeliver;
  late String _entreprise;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un nouveau Livreur"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom du Livreur'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir le nom du Livreur';
                  }
                  return null;
                },
                onSaved: (value) {
                  _DeliverName = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Adresse mail du livreur'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir l\'adresse du livreur';
                  }
                  return null;
                },
                onSaved: (value) {
                  _DeliverAddress = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Numero de telephone'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir le numero de telephone';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phonedeliver = value! as int;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Vehicule'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir le vehicule du livreur ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _vehiculedeliver = int.parse(value!) as String;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Entreprise de provenance'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir l\'entreprise de livraison ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _entreprise = int.parse(value!) as String;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'mot de passe/identifiant'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez saisir l\'identifiant ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = int.parse(value!) as String;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      // Ici, je vais pouvoir ajouter la logique pour creer les livreurs
                      // Par exemple, envoi des données à un serveur, affichage des  livreurs, etc.
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Livreur créée avec succès !')));
                    }
                  },
                  child: Text('Créer le Livreur'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
