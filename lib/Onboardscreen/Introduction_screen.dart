import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:projet/Onboardscreen/Home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  final List<PageViewModel> pages = [
    PageViewModel(
        title: '...Bienvenue...',
        body:
            'Vos colis sont soigneusement emballés et prêts à être livrés où que vous soyez dans la zone',
        footer: const Text(''),
        image: Center(
          child: Image.asset('assets/images/post.png'),
        ),
        decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            titleTextStyle:
                TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: '...continue...',
        body:
            'Les livreurs sont Hautements qualifiés et toujour disponibe pour effectuer vos livraisons',
        footer: const Text(''),
        image: Center(
          child: Image.asset('assets/images/deliver.png'),
        ),
        decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            titleTextStyle:
                TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: '...continue...',
        body:
            'Suivez le deplacement ainsi que le statut de vos colis en temps réel',
        footer: const Text(''),
        image: Center(
          child: Image.asset('assets/images/Delivery-amico (1).png'),
        ),
        decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            titleTextStyle:
                TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
    PageViewModel(
        title: '...Continue...',
        body:
            'Livraison dans les délais et satisfaisantion de la clientèlle assurés   ',
        footer: const Text(''),
        image: Center(
          child: Image.asset('assets/images/livraison.png'),
        ),
        decoration: PageDecoration(
            bodyTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            titleTextStyle:
                TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.grey,
            activeSize: Size.square(15),
            activeColor: Color.fromARGB(255, 61, 9, 126),
          ),
          showDoneButton: true,
          done: const Text(
            'Terminé',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Passer',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Text(
            'Suivant',
            style: TextStyle(fontSize: 20),
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Homescreen()),
    );
  }
}
