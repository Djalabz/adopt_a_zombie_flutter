import 'package:flutter/material.dart';
import 'package:cool_app/components/button.dart';
import 'package:cool_app/components/title.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  SignupFormState createState() => SignupFormState();
}

class SignupFormState extends State<SignupForm> {
  final signupKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // cette ligne est nécessaire pour que le widget puisse être construit
  // _SignupFormState({super.key});

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
                        child: TextFormField(
                          controller: nameController,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),

                          // Style de l'input
                          decoration: InputDecoration(
                            labelText: 'Name',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            floatingLabelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),

                          // Le validator vérifie que le champ n'est pas vide
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            floatingLabelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: passwordController,
                          cursorColor: const Color.fromARGB(255, 139, 23, 0),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 139, 23, 0)),
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 139, 23, 0)),
                            ),
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 139, 23, 0)),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          cursorColor: const Color.fromARGB(255, 139, 23, 0),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 139, 23, 0)),
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 139, 23, 0)),
                            ),
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 139, 23, 0)),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please confirm your password';
                            }
                            return null;
                          },
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
