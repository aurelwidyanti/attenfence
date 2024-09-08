import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Network {
  final Uri _url = Uri.parse('https://33a4-36-72-215-236.ngrok-free.app/api/');

  String? _token;

  Future<void> _getToken() async {
    final storage = FlutterSecureStorage();
    var tokenJson = await storage.read(key: 'token') ?? '';

    if (tokenJson.isNotEmpty) {
      try {
        Map<String, dynamic> token = jsonDecode(tokenJson);
        if (token.containsKey('token')) {
          _token = token['token'];
        }
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    }
  }

  Map<String, String> _setHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
      'ngrok-skip-browser-warning': 'true',
    };
  }

  Future<http.Response> post(data, endpoint) async {
    try {
      await _getToken();
      return http.post(
        _url.resolve(endpoint),
        headers: _setHeaders(),
        body: jsonEncode(data),
      );
    } catch (e) {
      print("Error POST: $e");
      return http.Response('{"message": "Error making POST request: $e"}', 500);
    }
  }

  Future<http.Response> get(endpoint) async {
    try {
      await _getToken();
      return http.get(
        _url.resolve(endpoint),
        headers: _setHeaders(),
      );
    } catch (e) {
      print("Error GET: $e");
      return http.Response('{"message": "Error making GET request: $e"}', 500);
    }
  }
}
