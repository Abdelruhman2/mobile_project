import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

//https://newsdata.io/documentation/#latest-news

class NewsService {
  final Dio dio;

  NewsService({required this.dio});

  Future<List<ArticleModel>> getNews(String cat) async {
    try {
      var response = await dio.get(
          'https://newsdata.io/api/1/news?apikey=pub_524984e41d11dcf9deeb79a7461ff726f81b5&country=eg&language=ar&category=${cat}');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> listArticles = jsonData['results'];
      List<ArticleModel> listOfArticles = [];
      for (var article in listArticles) {
        ArticleModel articlemodel = ArticleModel(
            img: article['image_url'],
            title: article['title'],
            description: article['description']);
        listOfArticles.add(articlemodel);
      }
      return listOfArticles;
    } catch (e) {
      return [];
    }
  }
}
