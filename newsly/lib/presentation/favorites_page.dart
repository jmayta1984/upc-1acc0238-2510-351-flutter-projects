import 'package:flutter/material.dart';
import 'package:newsly/data/favorites_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoriteNews> _favoriteNewsList = [];

  Future<void> _loadFavoriteNews() async {
    List<FavoriteNews> favoriteNewsList = await FavoritesNewsDao()
        .getFavoriteNews();
    setState(() {
      _favoriteNewsList = favoriteNewsList;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteNews();
  }

  @override
  Widget build(BuildContext context) {
    return FavoriteNewsListView(
      favoriteNewsList: _favoriteNewsList,
      onDelete: _loadFavoriteNews,
    );
  }
}

class FavoriteNewsListView extends StatelessWidget {
  const FavoriteNewsListView({
    super.key,
    required this.favoriteNewsList,
    required this.onDelete,
  });

  final List<FavoriteNews> favoriteNewsList;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteNewsList.length,
      itemBuilder: (context, index) {
        final news = favoriteNewsList[index];
        return Card(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  news.image,
                  height: 90.0,
                  width: 90.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error, size: 50.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(news.author),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  FavoritesNewsDao().deleteFavoriteNews(news.title);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('News removed from favorites'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  onDelete();
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        );
      },
    );
  }
}
