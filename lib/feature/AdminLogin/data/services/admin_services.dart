import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AdminServices {
  final baseUrl = dotenv.env['BASE_URL'];
  Future<Map<String, dynamic>> authLogin(String email, String pass) async {
    final url = Uri.parse('$baseUrl/admin/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': pass,
      }),
    );

     if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }
}
