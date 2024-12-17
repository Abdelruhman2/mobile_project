import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  final ArticleModel article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: SizedBox(
          width: 100, // Constrain the width of the leading widget
          height: 80,
          child: article.img != null
              ? Image.network(
                  article.img!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Image loaded successfully
                    } else {
                      return const Center(
                        child:
                            CircularProgressIndicator(), // Show loading spinner
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey, // Placeholder for broken image
                    );
                  },
                )
              : const Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color:
                      Colors.grey, // Placeholder when no image URL is provided
                ),
        ),
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          // Add navigation to detailed article view here
        },
      ),
    );
  }
}
