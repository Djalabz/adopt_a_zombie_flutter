import 'package:cool_app/components/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cool_app/components/button.dart';
import 'package:cool_app/components/title.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatelessWidget {
  final loginKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  Future<void> loginUser() async {
    // On vérifie que le formulaire est valide
    if (loginKey.currentState!.validate()) {
      try {
        // On envoie les données au serveur
        final response = await http.post(
          Uri.http('localhost:3000', 'users/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'email': emailController.text,
            'password': passwordController.text,
          }),
        );

        if (response.statusCode == 200) {
          print(response.body);
          // Handle successful login, e.g., navigate to the profile page
          // Navigator.pushNamed(context, '/profile');
        }
      } catch (error) {
        print('Error making HTTP request: $error');
      }
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        // Container qui contient le formulaire de login
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Titre du login - component "title"
              const CreepText(text: "Login", fontSize: 60),

              // Espacement horizontal
              const SizedBox(height: 40),

              // Formulaire de login
              Material(
                color: Theme.of(context).colorScheme.secondary,
                child: Form(
                  key: loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                      const SizedBox(height: 40),

                      // Bouton de login
                      SizedBox(
                        child: MyButton(
                          text: "login",
                          onPressed: () {
                            loginUser();
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
