class ArticleSource{
  final String id;
  final String name;

  ArticleSource({
    required this.id,
    required this.name,
  });

  factory ArticleSource.fromMap(Map<String, dynamic> json){
    return ArticleSource(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
    );
  }
}