import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_app/components/button.dart';

class SignupPage extends StatelessWidget {
  final signup = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // cette ligne est nécessaire pour que le widget puisse être construit
  SignupPage({super.key});

  // override signifie que la méthode de la classe parente est remplacée
  @override
  // build est une méthode qui retourne un widget (ici un Scaffold)
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 211, 194),
      body: Center(
        // Container qui contient le formulaire de Signup
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Titre du Signup
              Text(
                "Signup",
                style: GoogleFonts.creepster(
                  fontSize: 50,
                  color: const Color.fromARGB(255, 139, 23, 0),
                  decoration: TextDecoration.none,
                ),
              ),

              // Espacement horizontal
              const SizedBox(height: 40),

              // Formulaire de Signup
              Material(
                color: const Color.fromARGB(255, 255, 211, 194),
                child: Form(
                  key: signup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Espacement horizontal
                      SizedBox(
                        width: double.infinity,

                        // Input pour le nom
                        child: TextFormField(
                          controller: _nameController,
                          cursorColor: const Color.fromARGB(255, 139, 23, 0),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 139, 23, 0)),

                          // Style de l'input
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 139, 23, 0)),
                            ),
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 139, 23, 0)),
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
                          cursorColor: const Color.fromARGB(255, 139, 23, 0),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 139, 23, 0)),
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 139, 23, 0)),
                            ),
                            floatingLabelStyle: TextStyle(
                                color: Color.fromARGB(255, 139, 23, 0)),
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
