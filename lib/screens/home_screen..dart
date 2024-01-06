import 'package:flutter/material.dart';
import 'package:simple_news/services/news_headlines_api.dart';
import '../models/article.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Article> articles;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  Future<void> _getNews() async { // function to get news articles
    try {
      setState(() {
        isLoading = true;
        isError = true;
      });

      final news = await NewsHeadlines.fetchNews();
      setState(() {
        articles = news;
        if(news.isEmpty){ // we are returning empty list form api class in case of error
          isError = true;
        }else {
          isError = false;
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        articles = []; // Clear articles on error
        isLoading = false;
        isError = true;
      });
    }
  }

  Widget _buildArticleList() { // returns either error msg or list or news articles
      if(isError){
        return const Center(child: Text('Error Loading the News!\nTry Again!'));
      }else {
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Image.network(
                    articles[index].urlToImage,
                  ),
                  ListTile(
                    title: Center(child: Text(articles[index].author)),
                    subtitle: Text(articles[index].title),
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        articles[index].getDate,
                      ),
                      const SizedBox(width: 20.0)
                    ],
                  ),
                  const SizedBox(height: 20.0)
                ],
              ),
            );
          },
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'News Headlines',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Visibility(
        visible: isLoading,
        replacement: _buildArticleList(),
        child: const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getNews,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
