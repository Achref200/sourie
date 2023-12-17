import 'package:flutter/material.dart';
import '../Components/drawer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const CustomDrawer(),
      body: const Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tap to change picture',
                      style: TextStyle(
                        fontSize: 15,
                        // color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Card(
            shadowColor: Colors.transparent,
            margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            child: ListTile(
              leading: Icon(Icons.face),
              title: Text('Change Name'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            shadowColor: Colors.transparent,
            margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            child: ListTile(
              leading: Icon(Icons.email),
              title: Text('Change Email'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            shadowColor: Colors.transparent,
            margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text('Change Password'),
              subtitle: Text('•••••••••••••••••'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Divider(
            height: 30,
            indent: 30,
            endIndent: 30,
          ),
          Card(
            shadowColor: Colors.transparent,
            margin: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text('Change Language'),
              subtitle: Text('English'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
