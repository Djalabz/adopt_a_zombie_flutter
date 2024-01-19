// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_app/components/button.dart';

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
            const SizedBox(height: 15),

            // Titre de l'App
            Text(
              "Adopt a Zombie",
              style: GoogleFonts.creepster(
                fontSize: 50,
                color: const Color.fromARGB(255, 139, 23, 0),
              ),
            ),

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
            Text(
              "Find the perfect soulmate from under the grave !",
              textAlign: TextAlign.center,
              style: GoogleFonts.creepster(
                fontSize: 30,
                color: const Color.fromARGB(255, 139, 23, 0),
              ),
            ),

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
