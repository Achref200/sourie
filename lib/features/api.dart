// api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
 Future<List<Map<String, dynamic>>> fetchData() async {
   final response = await http.get(Uri.parse('https://mocki.io/v1/af07bbe2-5e79-40e1-85bb-229eb175d815'));

   if (response.statusCode == 200) {
     List<Map<String, dynamic>> clients = List<Map<String, dynamic>>.from(jsonDecode(response.body)['clients']);
     return clients;
   } else {
     throw Exception('Failed to load data');
   }
 }
}
