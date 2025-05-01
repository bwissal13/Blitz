import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rider.dart';
import '../models/request.dart';

class ApiService {
  static const String baseUrl = 'https://blitz.free.beeceptor.com';

  Future<Rider> fetchNextRider() async {
    final url = Uri.parse('$baseUrl/riders/next');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Rider.fromJson(data);
      } else {
        return Rider(estimatedArrivalTime: 'Server error');
      }
    } catch (e) {
      return Rider(estimatedArrivalTime: 'Request failed');
    }
  }

  Future<List<Request>> fetchRequestHistory() async {
    final url = Uri.parse('$baseUrl/requests');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Request.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      print('Error fetching request history: $e');
      return [];
    }
  }

  Future<bool> sendRequest(String phone) async {
    final url = Uri.parse('$baseUrl/request');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone}),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Error sending request: $e');
      return false;
    }
  }
}