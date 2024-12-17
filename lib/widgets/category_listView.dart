import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_news.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(img: 'assets/Bussiness.jpg', catName: 'business'),
    CategoryModel(img: 'assets/entertainment.jpeg', catName: 'entertainment'),
    CategoryModel(img: 'assets/health.jpeg', catName: 'health'),
    CategoryModel(img: 'assets/science.jpeg', catName: 'science'),
    CategoryModel(img: 'assets/sports.jpeg', catName: 'sports'),
    CategoryModel(img: 'assets/technology.jpeg', catName: 'technology'),
    CategoryModel(img: 'assets/genral.jpeg', catName: 'general'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryNewsScreen(category: categories[index].catName),
                ),
              );
            },
            child: CategoryCard(
              category: categories[index],
            ),
          );
        },
      ),
    );
  }
}
