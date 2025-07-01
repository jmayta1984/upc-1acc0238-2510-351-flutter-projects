import 'dart:convert';
import 'dart:io';

import 'package:mynasainsights/data/nasa_image_dto.dart';
import 'package:mynasainsights/domain/nasa_image.dart';
import 'package:http/http.dart' as http;

class NasaImageService {
  Future<List<NasaImage>> searchNasaImages(String query) async {
    final url = Uri.parse(
      'https://images-api.nasa.gov/search?q=$query&page=1&page_size=20',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == HttpStatus.ok) {
        final List items = jsonDecode(response.body)['collection']['items'];
        return items
            .map(
              // Convert each item to NasaImageDto and then to NasaImage domain model
              (item) => NasaImageDto.fromJson(item).toDomain(),
            )
            .toList();
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      throw Exception('Failed to load images: $e');
    }
  }
}
