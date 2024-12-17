import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(category.img), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          category.catName,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
