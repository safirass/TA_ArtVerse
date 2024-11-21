import 'dart:convert';
import '../models/artwork_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.artic.edu/api/v1';

  static Future<List<Artwork>> fetchArtworks() async {
    final String apiUrl = '$baseUrl/artworks';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Artwork> artworks = [];
      for (var item in data['data']) {
        artworks.add(Artwork.fromJson(item));
      }
      return artworks;
    } else {
      throw Exception('Failed to load artworks');
    }
  }
}
