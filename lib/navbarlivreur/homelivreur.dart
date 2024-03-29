import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet/Navbar%20du%20gestionnaire/NavbarAdmin.dart';
import 'package:projet/Navbar%20du%20gestionnaire/creecommande.dart';

class livreur extends StatefulWidget {
  @override
  _livreurState createState() => _livreurState();
}

class _livreurState extends State<livreur> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  bool _bool = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.menu_rounded),
            splashColor: Colors.transparent,
            onPressed: () {
              if (_bool == true) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              _bool = false;
            },
          ),
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
                    return (OrderForm());
                  }));
                },
                child: Row(
                    // Utiliser un widget Row pour aligner l'icône et le texte horizontalement

                    ),
              ),
            )
          ]),
      body: Stack(
        children: [
          // Arrière-plan
          Background(),

          // Contenu au centre de l'écran
          Center(
            child: Text('Aucune commande n\'est disponible pour l\'instant'),
          ),

          // Tiroir de navigation en bas de l'écran
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomNavigationDrawer(),
          ),
        ],
      ),
    );
  }

  Widget CustomNavigationDrawer() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: _animation1.value, sigmaX: _animation1.value),
      child: SingleChildScrollView(
        child: Container(
          height: _bool ? 0 : _height,
          width: _bool ? 0 : _width,
          color: Colors.transparent,
          child: Center(
            child: Transform.scale(
              scale: _animation3.value,
              child: Container(
                width: _width * .6,
                height: _width * 1.1,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 35,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        MyTile(Icons.home, 'Home', () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                            msg: 'Button pressed',
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (Content) {
                            return (navbaradmin());
                          }));
                        }),
                        MyTile(Icons.person, 'Profile', () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                            msg: 'Button pressed',
                          );
                        }),
                        MyTile(Icons.notifications, 'Notification', () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                            msg: 'Button pressed',
                          );
                        }),
                        MyTile(Icons.settings_outlined, 'Settings', () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                            msg: 'Button pressed',
                          );
                        }),
                        MyTile(Icons.info_outline_rounded, 'About', () {
                          HapticFeedback.lightImpact();
                          Fluttertoast.showToast(
                            msg: 'Button pressed',
                          );
                        }),
                      ],
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Background() {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Color.fromARGB(255, 236, 230, 230),
        ));
  }

  Widget MyTile(
    IconData icon,
    String title,
    VoidCallback voidCallback,
  ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        divider()
      ],
    );
  }

  Widget divider() {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }
}
