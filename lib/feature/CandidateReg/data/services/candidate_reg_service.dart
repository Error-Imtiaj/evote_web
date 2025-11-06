import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CandidateRegService {
  final baseUri = dotenv.env['BASE_URL'];
  Future<Map<String, dynamic>> candidate(String name, String party) async {
    final uri = Uri.parse('$baseUri/candidate/add');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: jsonEncode({"name": name, "party": party}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register voter: ${response.body}');
    }
  }
}
