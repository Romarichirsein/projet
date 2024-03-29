import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:projet/Navbar%20du%20gestionnaire/Creelivreur.dart';

class comptelivreur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Changer la couleur en blanc
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (Content) {
                  return (DeliverForm());
                }));
              },
              child: Row(
                // Utiliser un widget Row pour aligner l'icône et le texte horizontalement
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      // Utiliser un conteneur pour entourer l'icône d'un cercle bleu
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment
                          .centerLeft, // Ajouter cette ligne pour centrer le contenu
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Text(
                    "Créé Livreur", // Ajouter le texte "Créé"
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
        title: Text("Livreur"),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 20,
          itemBuilder: (BuildContext c, int i) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Informations complètes du livreur $i"),
                      titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      content: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(text: 'Nom: Nguemi\n\n ',),
                          TextSpan(
                              text: '@mail: romarichirsein@gmail.com\n\n '),
                          TextSpan(text: 'telephone: 692738430\n\n '),
                          TextSpan(text: 'Vehicule: voiture\n\n '),
                          TextSpan(text: 'Entreprise: Glotelho\n\n '),
                        ]),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Fermer'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: AnimationConfiguration.staggeredList(
                position: i,
                delay: Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: 30,
                  verticalOffset: 300.0,
                  child: FlipAnimation(
                    duration: Duration(milliseconds: 3000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    flipAxis: FlipAxis.y,
                    child: Container(
                      margin: EdgeInsets.only(bottom: _w / 20),
                      height: _w / 4,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Livreur $i",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Suppression "),
                                    content: Text(
                                        "voulez vous vraiment supprimer le Livreur $i"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Supprimer'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Annuler'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  widget({required Text child}) {}
}
