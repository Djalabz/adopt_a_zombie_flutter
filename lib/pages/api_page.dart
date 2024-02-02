import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cool_app/components/button.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  ApiPageState createState() => ApiPageState();
}

class ApiPageState extends State<ApiPage> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final name = user['name']['first'];
              final email = user['email'];
              final image = user['picture']['thumbnail'];
              return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(image)),
                  title: Text(name),
                  subtitle: Text(email));
            }),
        floatingActionButton: MyButton(
          text: "Make request",
          onPressed: fetchUsers,
        ));
  }

  // Fonction asynchrone aui vient fetch les users depuis l'API
  Future<void> fetchUsers() async {
    try {
      var res =
          await http.get(Uri.parse('https://randomuser.me/api/?results=50'));

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        setState(() {
          users = data['results'];
        });
      } else {
        return Future.error('Erreur lors du fetch');
      }
    } catch (err) {
      return Future.error(err);
    }
  }
}
