import 'dart:convert';
import 'package:http/http.dart' as http;

class MongolianMarketService {
  static const String _baseUrl = 'https://api.mse.mn'; // Replace with actual API URL
  final String _apiKey; // You may need an API key

  MongolianMarketService(this._apiKey);

  Future<List<Map<String, dynamic>>> getRealtimeStocks() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/stocks/realtime'),
        headers: {'Authorization': 'Bearer $_apiKey'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['stocks']);
      } else {
        throw Exception('Failed to load stocks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch stock data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getRealtimeIndices() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/indices/realtime'),
        headers: {'Authorization': 'Bearer $_apiKey'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['indices']);
      } else {
        throw Exception('Failed to load indices: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch index data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getMarketNews() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/news/latest'),
        headers: {'Authorization': 'Bearer $_apiKey'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data['news']);
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}