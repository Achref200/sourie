import 'package:flutter/material.dart';
import '../Screens/first.dart';
import '../Screens/home.dart';
import 'table.dart';
import 'form.dart';
import '../Screens/help.dart';
import '../Screens/settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.transparent),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.image),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Achref Ben Yaagoub',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'achref@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(Icons.home_filled),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => First(),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Table"),
            leading: const Icon(Icons.data_object),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TableScreen(),
                  ),
                );
              }
            },
          ),
          ListTile(
            title: const Text("Form"),
            leading: const Icon(Icons.dashboard),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const FormScreen(),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Profile"),
            leading: const Icon(Icons.supervised_user_circle),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Poop(),
                  ),
                );
              }
            },
          ),
          ListTile(
            title: const Text("Help"),
            leading: const Icon(Icons.help),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Support(),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(Icons.settings),
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Settings(),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
