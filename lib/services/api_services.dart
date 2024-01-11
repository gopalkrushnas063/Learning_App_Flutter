import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://gopalkrushnas063.github.io/Test_Series_JSON/';

  Future<List<dynamic>> fetchAllBanners() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/banners.json'));

      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);
        if (jsonResponse is List) {
          return jsonResponse;
        }
      }
      throw Exception('Failed to fetch banners');
    } catch (e) {
      throw Exception('Failed to fetch banners: $e');
    }
  }

  Future<List<dynamic>> fetchDataFromApi(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      throw Exception('Failed to fetch data from $endpoint');
    } catch (e) {
      throw Exception('Failed to fetch data from $endpoint: $e');
    }
  }

  Future<http.Response> registerUser(
    String name,
    String phoneNumber,
    String email,
    String password,
  ) async {
    final url = Uri.parse('http://localhost:8090/user/register');
    final body = json.encode({
      "name": name,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
    });

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    return response;
  }
}
