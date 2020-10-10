import 'dart:convert';
import 'dart:ffi';
import 'package:news_24/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  // ignore: missing_return
  Future<Void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=ng&apiKey=5c2b29a151894d19b6f25b6569b33d51";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            publishedAt: DateTime.parse(element['publishedAt']),
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<Void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=ng&category=$category&apiKey=5c2b29a151894d19b6f25b6569b33d51";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            publishedAt: DateTime.parse(element['publishedAt']),
          );

          news.add(articleModel);
        }
      });
    }
  }
}
