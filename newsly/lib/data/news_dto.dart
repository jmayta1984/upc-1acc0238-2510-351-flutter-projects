import 'package:newsly/domain/news.dart';

class NewsDto {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String source;

  const NewsDto({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory NewsDto.fromJson(Map<String, dynamic> json) {
    return NewsDto(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
      source: json['source']['name'] ?? '',
    );
  }

  News toDomain() {
    return News(
      title: title,
      image: urlToImage,
      author: author,
      year: publishedAt.split('-')[0],
      content: content,
      source: source,
      description: description,
    );
  }
}
