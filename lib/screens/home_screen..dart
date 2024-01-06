import 'package:flutter/material.dart';
import 'package:simple_news/services/news_headlines_api.dart';

import '../models/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Article> articles = [];
  bool isLoading = true;
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
      body: Visibility(
        visible: isLoading,
        replacement: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index){
              return Card(
                child: Column(
                  children: [
                    Image.network(articles[index].urlToImage),
                    ListTile(
                      title: Center(child: Text(articles[index].author)),
                      subtitle: Text(articles[index].title),
                      leading: CircleAvatar(
                        child: Text('${index+ 1}'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${articles[index].getDate}',
                        ),
                        const SizedBox(width: 20.0,)
                      ],
                    ),
                    const SizedBox(height: 20.0,)
                  ],
                ),
              );
            }),
        child: const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchNews,
        child: const Icon(Icons.refresh),
      ),
    );
  }
  void fetchNews() async {
    setState(() {
      isLoading = true;
    });
    final news = await NewsHeadlines.fetchNews();
    setState(() {
      articles = news;
      isLoading = false;
    });
  }
}
