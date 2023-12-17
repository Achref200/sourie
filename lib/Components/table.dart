import 'package:flutter/material.dart';
import 'drawer.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class TableScreen extends StatelessWidget {
   TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Data Users",
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text('User ID'),
                    ),
                    DataColumn(
                      label: Text(' User Name'),
                    ),
                    DataColumn(
                      label: Text('User Email'),
                    ),
                    DataColumn(
                      label: Text('user Phone'),
                    ),
                  ],
                  rows: snapshot.data!.map((client) {
                    return DataRow(cells: [
                      DataCell(Text(client["id"].toString())),
                      DataCell(Text(client["name"].toString())),
                      DataCell(Text(client["email"].toString())),
                      DataCell(Text(client["phone"].toString())),
                    ]);
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/72651a97-7211-438b-843d-2ed81e4802cc'));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> clients =
          List<Map<String, dynamic>>.from(jsonDecode(response.body)['clients']);
      return clients;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
