import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RandomUserScreen(),
    );
  }
}

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({super.key});

  @override
  RandomUserScreenState createState() => RandomUserScreenState();
}


class RandomUserScreenState extends State<RandomUserScreen> {
  List<dynamic> users = [];

  // Fonction pour récupérer les données via l'API
  Future<void> fetchRandomUsers() async {
    final url = Uri.parse('https://randomuser.me/api/?results=10'); // Récupère 10 utilisateurs
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          users = data['results']; // Met à jour la liste des utilisateurs
        });
      } else {
        throw Exception('Erreur de chargement des users');
      }
    } catch (e) {
      print('Erreur: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erreur lors du chargement des données')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Back',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),

      body: Column(
        children: [
          ElevatedButton(
            onPressed: fetchRandomUsers, // Bouton pour déclencher la requête API
            child: const Text('Charger les profils de l\'API'),
          ),
          Expanded(
            child: users.isEmpty
                ? const Center(child: Text('Aucun zombie ici présent ...'))
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      final name = '${user['name']['first']} ${user['name']['last']}';
                      final email = user['email'];
                      final imageUrl = user['picture']['large'];

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                        title: Text(name, 
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(email),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
