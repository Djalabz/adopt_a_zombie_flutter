import 'package:flutter/material.dart';
import 'pages/intro_page.dart';
import 'pages/signup_page.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // On retire la bannière de debug
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        // On définit la page d'intro comme page d'accueil
        home: const IntroPage(),
        // On définit les routes de l'application
        routes: {
          '/signup': (context) => SignupPage(),
          '/profile': (context) => const ProfilePage(),
          '/login': (context) => LoginPage(),
          // '/projects': (context) => ProjectsPage(),
          // '/project': (context) => ProjectPage(),
          // '/project/edit': (context) => EditProjectPage(),
          // '/project/add': (context) => AddProjectPage(),
        });
  }
}
