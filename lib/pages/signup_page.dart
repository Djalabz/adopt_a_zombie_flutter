import 'package:cool_app/components/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cool_app/components/button.dart';
import 'package:cool_app/components/title.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatelessWidget {
  final signupKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // cette ligne est nécessaire pour que le widget puisse être construit
  // super.key est une propriété de la classe parente qui permet de définir une clé afin d'identifier le widget
  SignupPage({super.key});

  // Fonction registerUser qui envoie les données du formulaire à l'API
  Future<void> registerUser() async {
    // On vérifie que les deux mots de passe sont identiques
    if (passwordController.text != confirmPasswordController.text) {
      return;
    } else {
      // On vérifie que le formulaire est valide
      if (signupKey.currentState!.validate()) {
        try {
          // On envoie les données au serveur
          final response = await http.post(
            Uri.http('localhost:3000', 'users/signup'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'name': nameController.text,
              'email': emailController.text,
              'password': passwordController.text,
              'confirmPassword': confirmPasswordController.text,
            }),
          );

          if (response.statusCode == 200) {
            print(response.body);
            // Handle successful signup, e.g., navigate to the profile page
            // Navigator.pushNamed(context, '/profile');
          }
        } catch (error) {
          print('Error making HTTP request: $error');
        }
      } else {
        print('Form is invalid');
      }
    }
  }

  // override signifie que la méthode de la classe parente est remplacée
  @override
  // build est une méthode qui retourne un widget (ici un Scaffold)
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        // Container qui contient le formulaire de Signup
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Titre du Signup - component "title"
              const CreepText(text: "Signup", fontSize: 60),

              // Espacement horizontal
              const SizedBox(height: 40),

              // Formulaire de Signup
              Material(
                color: Theme.of(context).colorScheme.secondary,
                child: Form(
                  key: signupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,

                        // Input pour le nom
                        child: MyTextFormField(
                          controller: nameController,
                          labelText: 'Name',
                          error: 'Please enter your name',
                        ),
                      ),

                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,
                        child: MyTextFormField(
                          controller: emailController,
                          labelText: 'Email',
                          error: 'Please enter your email adress',
                        ),
                      ),

                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,
                        child: MyTextFormField(
                          controller: passwordController,
                          labelText: 'Password',
                          error: 'Please enter a password',
                          hidden: true,
                        ),
                      ),

                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,
                        child: MyTextFormField(
                          controller: confirmPasswordController,
                          labelText: 'Confirm Password',
                          error: 'Please confirm your password',
                          hidden: true,
                        ),
                      ),

                      // Espacement horizontal
                      const SizedBox(height: 40),

                      // Bouton de Signup
                      SizedBox(
                        child: MyButton(
                          text: "Signup now",
                          onPressed: () {
                            registerUser();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
