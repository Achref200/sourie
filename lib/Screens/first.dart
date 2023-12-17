import 'package:flutter/material.dart';
import '../Components/drawer.dart';
import '../Components/form.dart';

class First extends StatefulWidget {
  First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> humans = [
      {"name": "Fedy", "mail": "fedy@gmail.com"},
      {"name": "Adem", "mail": "adem@gmail.com"},
      {"name": "Malek", "mail": "malek@gmail.com"},
      {"name": "Dhaker", "mail": "zaker@gmail.com"},
      {"name": "Achref", "mail": "achref@gmail.com"},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            );
          },
        ),
        title: const Text("Boys List"),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text(
            "List of Participants.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              fontFamily: 'poppins',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: SearchBar(
              hintText: "Search here...",
              leading: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Get started your exciting journey with us.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'poppins',
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "Assets/Images/Travel.png",
              width: 300,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 25,
            thickness: 3,
            indent: 30,
            endIndent: 30,
            color: Color.fromARGB(255, 148, 148, 148),
          ),
          const SizedBox(height: 10),
          for (var human in humans)
            Card(
              shadowColor: Colors.transparent,
              child: ListTile(
                title: Text(human["name"]!),
                subtitle: Text(human["mail"]!),
                trailing: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {},
                ),
              ),
            ),
          const SizedBox(height: 50),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
