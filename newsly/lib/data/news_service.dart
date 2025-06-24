import 'dart:convert';
import 'dart:io';

import 'package:newsly/data/news_dto.dart';
import 'package:newsly/domain/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<News>> findNews(String query) async {
    final response = await http.get(
      Uri.parse(
        'https://dev.formandocodigo.com/articles.php?description=$query',
      ),
    );

    try {
      if (response.statusCode == HttpStatus.ok) {
        final List maps = jsonDecode(response.body);
        return maps.map((json) => NewsDto.fromJson(json).toDomain()).toList();
      } else {
        throw HttpException('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
