import 'package:flutter/material.dart';
import 'package:cool_app/components/button.dart';
import 'package:cool_app/components/title.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatelessWidget {
  final signupKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // cette ligne est nécessaire pour que le widget puisse être construit
  SignupPage({super.key});

  // Future<void> signup() async {
  //   final response = await http.post(
  //     Uri.parse('https://localhost:3000/signup'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'name': _nameController.text,
  //       'email': _emailController.text,
  //       'password': _passwordController.text,
  //       'confirmPassword': _confirmPasswordController.text,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     Navigator.pushNamed(context, '/profile');
  //   } else {
  //     throw Exception('Failed to signup');
  //   }
  // }

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
                          controller: _nameController,
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
                          controller: _emailController,
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
                          controller: _passwordController,
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
                          controller: _confirmPasswordController,
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
                            Navigator.pushNamed(context, '/');
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
