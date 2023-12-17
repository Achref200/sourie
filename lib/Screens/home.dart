import 'package:flutter/material.dart';
import '../Components/drawer.dart';

class Poop extends StatelessWidget {
  const Poop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profiles",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'poppins',
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              "Achref Ben Yaagoub",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'poppins',
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "Assets/Images/Urahara.jpg",
                width: 300,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shadowColor: Colors.transparent,
              child: ListTile(
                title: const Text("Achref"),
                subtitle: const Text("Ben Yaagoub"),
                leading: const Icon(Icons.verified_user),
                trailing: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {},
                ),
              ),
            ),
            Card(
              shadowColor: Colors.transparent,
              child: ListTile(
                title: const Text("achref@gmail.com"),
                subtitle: const Text("************"),
                leading: const Icon(Icons.mail_lock),
                trailing: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {},
                ),
              ),
            ),
            Card(
              shadowColor: Colors.transparent,
              child: ListTile(
                title: const Text("+216 53019984"),
                subtitle: const Text("Tunisian"),
                leading: const Icon(Icons.home),
                trailing: IconButton(
                  icon: Icon(Icons.keyboard_arrow_right_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Icon(
                  Icons.warning,
                  size: 22,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              title: const Text('For Now you cant edit anything',
                  style: TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Contact Him ?'),
            ),
          ],
        ),
      ),
    );
  }
}
