import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class VoterService {
  final baseUrl = dotenv.env['BASE_URL'];

  Future<Map<String, dynamic>> registerVoter({
    required String nid,
    required String name,
    required String birthDate,
  }) async {
    final url = Uri.parse('$baseUrl/voter/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'accept': 'application/json'},
      body: jsonEncode({
        'nid': nid,
        'name': name,
        'birth_date': birthDate,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register voter: ${response.body}');
    }
  }
}
