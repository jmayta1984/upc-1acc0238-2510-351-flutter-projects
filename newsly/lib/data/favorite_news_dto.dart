import 'package:newsly/domain/favorite_news.dart';

class FavoriteNewsDto {
  final String title;
  final String author;
  final String image;
  final String description;

  const FavoriteNewsDto({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

  factory FavoriteNewsDto.fromDatabase(Map<String, dynamic> json) {
    return FavoriteNewsDto(
      title: json['title'] as String,
      author: json['author'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toDatabase() {
    return {
      'title': title,
      'author': author,
      'image': image,
      'description': description,
    };
  }

  factory FavoriteNewsDto.fromDomain(FavoriteNews favoriteNews) {
    return FavoriteNewsDto(
      title: favoriteNews.title,
      author: favoriteNews.author,
      image: favoriteNews.image,
      description: favoriteNews.description,
    );
  }

  FavoriteNews toDomain() {
    return FavoriteNews(
      title: title,
      author: author,
      image: image,
      description: description,
    );
  }
}
