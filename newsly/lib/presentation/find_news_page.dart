import 'package:flutter/material.dart';
import 'package:newsly/data/news_service.dart';
import 'package:newsly/domain/news.dart';
import 'package:newsly/presentation/news_list_view.dart';

class FindNewsPage extends StatefulWidget {
  const FindNewsPage({super.key});

  @override
  State<FindNewsPage> createState() => _FindNewsPageState();
}

class _FindNewsPageState extends State<FindNewsPage> {
  List<News> _newsList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('FindNewsPage build');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search for news',
            ),
            onSubmitted: _findNews,
          ),
        ),
        Expanded(child: NewsListView(newsList: _newsList)),
      ],
    );
  }

  Future<void> _findNews(String query) async {
    final List<News> newsList = await NewsService().findNews(query);
    setState(() {
      _newsList = newsList;
    });
  }
}
