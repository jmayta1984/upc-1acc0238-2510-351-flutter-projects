import 'package:newsly/data/app_database.dart';
import 'package:newsly/data/favorite_news_dto.dart';
import 'package:newsly/domain/favorite_news.dart';

class FavoritesNewsDao {
  Future<void> insertFavoriteNews(FavoriteNews favoriteNews) async {
    final db = await AppDatabase().database;
    await db.insert(
      'news',
      FavoriteNewsDto.fromDomain(favoriteNews).toDatabase(),
    );
  }

  Future<void> deleteFavoriteNews(String title) async {
    final db = await AppDatabase().database;
    await db.delete('news', where: 'title = ?', whereArgs: [title]);
  }

  Future<List<FavoriteNews>> getFavoriteNews() async {
    final db = await AppDatabase().database;
    final List maps = await db.query('news');
    return maps
        .map((e) => FavoriteNewsDto.fromDatabase(e).toDomain())
        .toList();
  }

  Future<bool> isFavorite(String title) async {
    final db = await AppDatabase().database;
    final List maps = await db.query(
      'news',
      where: 'title = ?',
      whereArgs: [title],
    );
    return maps.isNotEmpty;
  }
}
