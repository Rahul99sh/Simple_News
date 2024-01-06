import 'article_source.dart';

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
        urlToImage: json['urlToImage'] ?? "",
        content: json['content'] ?? "",
        source: ArticleSource.fromMap(json['source']),
        publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
}

