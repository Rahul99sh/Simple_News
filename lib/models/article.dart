import 'article_source.dart';
import 'package:intl/intl.dart';

class Article{
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final ArticleSource source;
  final DateTime publishedAt;
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.source,
    required this.publishedAt,
  });
  factory Article.fromMap(Map<String, dynamic> json){
    return Article(
        author: json['author'] ?? "",
        title: json['title'],
        description: json['description'] ?? "",
        url: json['url'],
        urlToImage: json['urlToImage'] ?? "https://3.bp.blogspot.com/-mF42jMQOXhc/V4w8yTYMrTI/AAAAAAAAfUQ/6a1ycwG6YvocB4x8kM3PRor74u5HMuN1ACKgB/s1600/placeholder-image.jpg",
        content: json['content'] ?? "",
        source: ArticleSource.fromMap(json['source']),
        publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
  get getDate {
    return DateFormat('dd-MM-yy – HH:mm').format(publishedAt);
  }
}

