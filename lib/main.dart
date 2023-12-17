import 'package:flutter/material.dart';
import 'Screens/first.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            const ColorScheme.dark(primary: Color.fromARGB(255, 1, 190, 36)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home:  First(),
    );
  }
}
