import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/env.dart';
import '../models/modality_model.dart';

class ModalityService {
  final String _baseUrl;
  final http.Client httpClient;

  ModalityService({
    http.Client? httpClient,
    String? baseUrl,
  })  : httpClient = httpClient ?? http.Client(),
        _baseUrl = baseUrl ?? Env.apiBaseUrl;

  Future<List<ModalityModel>> fetchModalities(String token) async {
    final url = Uri.parse('$_baseUrl/Modality');
    print('[ModalityService] Fetching modalities from $url');

    try {
      final response = await httpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('[ModalityService] Status: ${response.statusCode}');
      print('[ModalityService] Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<dynamic> list = json['data']['data'];
        return list.map((e) => ModalityModel.fromJson(e)).toList();
      }
    } catch (e) {
      print('[ModalityService] Error: $e');
    }

    return [];
  }

  Future<ModalityModel?> fetchById(int id, String token) async {
    final url = Uri.parse('$_baseUrl/Modality/$id');
    print('[ModalityService] Fetching modality ID $id from $url');

    try {
      final response = await httpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('[ModalityService] Status: ${response.statusCode}');
      print('[ModalityService] Body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ModalityModel.fromJson(json['data']);
      }
    } catch (e) {
      print('[ModalityService] Error: $e');
    }

    return null;
  }
}
