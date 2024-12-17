import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_listView.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';
import 'package:news_app/screens/logout_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("News"),
            Text(
              " Cloud",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LogoutScreen()),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: CategoryListView(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
          NewsListViewBuilder(category: 'world'), // No wrapping required
        ],
      ),
    );
  }
}
