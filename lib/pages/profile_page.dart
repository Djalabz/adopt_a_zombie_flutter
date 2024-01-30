import 'package:cool_app/components/title.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 211, 194),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 139, 23, 0),
          elevation: 0,
          leading:
              const Icon(color: Color.fromARGB(255, 255, 211, 194), Icons.menu),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                    color: Color.fromARGB(255, 255, 211, 194), Icons.login))
          ]),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // espace horizontal
              const SizedBox(height: 90),

              // Titre pour ma page de profile
              const CreepText(text: "Profile", fontSize: 50),

              // const Image(
              //   image: AssetImage('lib/images/zombie.png'),
              //   width: 100,
              //   height: 100,
              // ),

              // SliverAppBar(
              //   expandedHeight: 200.0,
              //   floating: false,
              //   pinned: true,
              //   flexibleSpace: FlexibleSpaceBar(
              //     centerTitle: true,
              //     title: const Text("Collapsing Toolbar",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 16.0,
              //         )),
              //     background: Image.network(
              //       "https://images.unsplash.com/photo-1612835362597-4b7b7b0b4b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8em9tYmllJTIwc2hvcHBpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),

              // Image de mon zombie
              const SizedBox(height: 10),

              //
              Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text('Drawer Header'),
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
