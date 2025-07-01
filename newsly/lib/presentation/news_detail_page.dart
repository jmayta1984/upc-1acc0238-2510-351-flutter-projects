import 'package:flutter/material.dart';
import 'package:newsly/data/favorites_news_dao.dart';
import 'package:newsly/domain/favorite_news.dart';
import 'package:newsly/domain/news.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final isFavorite = await FavoritesNewsDao().isFavorite(widget.news.title);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

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
                  if (_isFavorite) {
                    FavoritesNewsDao().deleteFavoriteNews(widget.news.title);
                  } else {
                    FavoritesNewsDao().insertFavoriteNews(
                      FavoriteNews(
                        title: widget.news.title,
                        description: widget.news.content,
                        image: widget.news.image,
                        author: widget.news.author,
                      ),
                    );
                  }

                  setState(() {
                    _isFavorite = !_isFavorite;
                  });
                },
                icon: CircleAvatar(
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                height: height,
                width: double.infinity,
                child: Hero(
                  tag: widget.news.title,
                  child: Image.network(
                    widget.news.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.error, size: 50.0)),
                  ),
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
                Text(
                  widget.news.source,
                  style: const TextStyle(fontSize: 12.0),
                ),
                Text(
                  widget.news.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.news.author,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    widget.news.content,
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
