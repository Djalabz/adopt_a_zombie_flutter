// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cool_app/components/button.dart';
import 'package:cool_app/components/title.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 211, 194),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Espacement horizontal
            const SizedBox(height: 10),

            // Titre de l'App - component "title"
            const CreepText(text: "Adopt a Zombie !", fontSize: 70),

            const SizedBox(height: 10),

            // Image de l'App
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset('lib/images/zombie.png')),
              ),
            ),

            // Texte d'intro
            const CreepText(
                alignment: TextAlign.center,
                text: "find the perfect soulmate from under the grave...",
                fontSize: 30),

            const SizedBox(height: 10),

            // Bouton personnalisé issu de components
            MyButton(
                text: "Let's go !",
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                })
          ],
        ),
      ),
    );
  }
}
