import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryNewsScreen extends StatelessWidget {
  final String category;
  const CategoryNewsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$category News'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          NewsListViewBuilder(category: category), // Direct usage
        ],
      ),
    );
  }
}
