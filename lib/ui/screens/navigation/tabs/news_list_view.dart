import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/models/article_response/article.dart';
import 'package:news_app/models/source_response/source.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_items.dart';
import 'package:news_app/widget/_news.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.source});
  final Source source;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late Future<List<Article>> articlesFuture;

  @override
  void initState() {
    super.initState();
    articlesFuture =
        ApiManager.loadArticle(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidgetNews(error: snapshot.error.toString());
        } else if (snapshot.hasData) {
          List<Article> articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsItems(article: articles[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
