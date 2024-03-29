import 'package:flutter/material.dart';
//https://pub.dev/packages/nb_utils

class Historylivreur extends StatefulWidget {
  const Historylivreur({Key? key}) : super(key: key);

  @override
  _HistorylivreurState createState() => _HistorylivreurState();
}

class _HistorylivreurState extends State<Historylivreur> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historique de mes livraisons',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 30, top: 26),
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0), color: Colors.grey),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                backgroundColor: Colors.grey[100],
                title: Text(
                  'Livraison ${index + 1}',
                  style: primaryTextStyle(),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                  radius: 20,
                ),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: 32, top: 16, bottom: 16),
                collapsedIconColor: Colors.black,
                iconColor: Colors.grey[300],
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Id :',
                      style: TextStyle(color: Colors.black),
                      children: <InlineSpan>[
                        TextSpan(
                            text: ' 12786',
                            style: TextStyle(fontFamily: 'italic')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Due Date :',
                      style: TextStyle(color: Colors.black),
                      children: <InlineSpan>[
                        TextSpan(
                            text: ' Expired',
                            style: TextStyle(color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Livreur : ',
                      style: TextStyle(color: Colors.black),
                      children: <InlineSpan>[
                        TextSpan(
                            text: ' Nhr_Hackers',
                            style: TextStyle(fontFamily: 'italic')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: ' Date : ',
                      style: TextStyle(color: Colors.black),
                      children: <InlineSpan>[
                        TextSpan(
                            text: ' 20 Fevrier 2024 à 17:05  ',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text.rich(
                    TextSpan(
                      text: ' Statut: ',
                      style: TextStyle(color: Colors.black),
                      children: <InlineSpan>[
                        TextSpan(text: ' Livré', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    endIndent: 32,
                    color: Colors.black54,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'compagnie : ',
                      style: primaryTextStyle(),
                      children: <InlineSpan>[
                        TextSpan(
                            text: ' Glotelho', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26)),
                        child: Icon(
                          Icons.sports_handball,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26)),
                        child: Icon(
                          Icons.apartment_outlined,
                          color: Colors.black54,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

secondaryTextStyle() {
  Color.fromARGB(0, 106, 108, 112);
}

primaryTextStyle() {
  Color(0000);
}
