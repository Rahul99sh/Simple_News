import 'package:flutter/material.dart';
import 'package:simple_news/services/NewsHeadlinesApi.dart';

import '../models/Article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Article> articles = [];
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'News Headlines',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                title: Text(articles[index].author),
                leading: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(150.0)),
                    child: Image.network(articles[index].urlToImage),
                ),
                subtitle: Text(articles[index].title),
              ),
            );
      }),
    );
  }
  void fetchNews() async {
    final news = await NewsHeadlines.fetchNews();
    setState(() {
      articles = news;
    });
  }
}
