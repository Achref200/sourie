// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'drawer.dart';

class Users {
  final int id;
  final String username;
  final String email;
  final int phone;

  Users({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as int,
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool _isChecked = false;

  final idController = TextEditingController();
  final userIdController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  Future<void> postData() async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://7eb7-2c0f-f698-4190-1e20-74e0-dc35-2e9f-1497.ngrok-free.app/test'),
        body: jsonEncode(<String, dynamic>{
          'UserId': userIdController.text,
          'id': idController.text,
          'title': titleController.text,
          'body': bodyController.text,
        }),
      );

      print(jsonEncode(<String, dynamic>{
        'UserId': userIdController.text,
        'id': idController.text,
        'title': titleController.text,
        'body': bodyController.text,
      }));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        print('Data posted successfully: $responseData');
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception while posting data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Formulaire",
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
                Scaffold.of(context).openDrawer();
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
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(25),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'ID',
                hintText: 'Your ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(25),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'Username',
                hintText: 'Your full name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(25),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'Job Title',
                hintText: 'Your job title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(25),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                labelText: 'message',
                hintText: 'write what you want ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Checkbox(
                  tristate: true,
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Accept the terms and policies ",
                    style: TextStyle(
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_isChecked)
              FloatingActionButton.extended(
                onPressed: () {
                  postData();
                },
                label: const Text('Get Started !'),
                icon: const Icon(Icons.arrow_forward_ios),
              ),
          ],
        ),
      ),
    );
  }
}
