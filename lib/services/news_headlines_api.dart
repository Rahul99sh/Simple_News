import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_news/models/article.dart';

class NewsHeadlines {
  static Future<List<Article>> fetchNews() async{
      const String url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=417cbc3d23244a98ae03446b6b5974fc';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = jsonDecode(response.body);
      final result = body['articles'] as List<dynamic>;
      final allArticles = result.map((e) {
        return Article.fromMap(e);
      }).toList();
      return allArticles;
  }
}