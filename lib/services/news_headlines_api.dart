import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:simple_news/models/article.dart';

class NewsHeadlines {
  static const String _apiKey = '417cbc3d23244a98ae03446b6b5974fc';
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=in';

  static Future<List<Article>> fetchNews() async {
    try {
      const url = '$_baseUrl&apiKey=$_apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final List<dynamic> articles = body['articles'];
        return articles.map((e) => Article.fromMap(e)).toList();
      } else {
        // other status codes if needed
        if (kDebugMode) {
          print('Failed to load news: ${response.statusCode}');
        }
        return []; // Return an empty list in case of failure
      }
    } catch (e) {
      // e.g., network errors
      if (kDebugMode) {
        print('Exception while fetching news: $e');
      }
      return []; // Return an empty list on exception
    }
  }
}
