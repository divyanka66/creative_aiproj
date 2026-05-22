import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  Future<dynamic> getApi({
    required String url,
    required String token,
  }) async {

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    return jsonDecode(response.body);
  }

  Future<dynamic> postApi({
    required String url,
    required Map<String, dynamic> body,
  }) async {

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    return jsonDecode(response.body);
  }
}