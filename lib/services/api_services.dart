import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<dynamic>> fetchAllBanners() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gopalkrushnas063.github.io/Test_Series_JSON/banners.json'));

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
}