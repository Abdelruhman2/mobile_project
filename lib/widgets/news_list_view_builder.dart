import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String category;
  const NewsListViewBuilder({super.key, required this.category});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio()).getNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'An error occurred while loading news.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return NewsTile(article: snapshot.data![index]);
              },
              childCount: snapshot.data!.length,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'No news articles available for this category.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          );
        }
      },
    );
  }
}
