import 'package:flutter/material.dart';
import 'package:newsly/data/favorites_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:newsly/domain/news.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.3;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: height,

            title: ListTile(
              trailing: IconButton(
                onPressed: () {
                  FavoritesNewsDao().insertFavoriteNews(FavoriteNews(
                    title: news.title,
                    description: news.content,
                    image: news.image,
                    author: news.author,
                  ));
                },
                icon: Icon(Icons.favorite_border),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: height,
                child: Image.network(
                  news.image,
                  fit: BoxFit.cover,
                  height: height,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error, size: 50.0)),
                ),
              ),
            ),
            pinned: true,
            floating: false,
          ),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(news.source, style: const TextStyle(fontSize: 12.0)),
                Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  news.author,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    news.content,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
