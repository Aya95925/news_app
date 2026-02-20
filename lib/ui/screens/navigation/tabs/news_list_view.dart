import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/models/article_response/article.dart';
import 'package:news_app/models/source_response/source.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_items.dart';
import 'package:news_app/ui/utils/extension/context_extension.dart';
import 'package:news_app/widget/custom_container_news.dart';
import 'package:news_app/widget/error_widget_news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key, required this.source, this.query});
  final Source source;
  final String? query;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late Future<List<Article>> articlesFuture;

  @override
  void initState() {
    super.initState();
    articlesFuture = loadArticles();
  }

  @override
  void didUpdateWidget(covariant NewsListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != oldWidget.query) {
      articlesFuture = loadArticles();
    }
  }

  Future<List<Article>> loadArticles() {
    return ApiManager.loadArticle(widget.source.id!, query: widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: articlesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidgetNews(error: snapshot.error.toString());
        } else if (snapshot.hasData) {
          List<Article> articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showArticleBottomSheet(
                    context,
                    image: articles[index].urlToImage ?? '',
                    title: articles[index].title ?? '',
                    url: articles[index].url ?? '',
                  );
                },
                child: NewsItems(article: articles[index]),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  
  Future<void> showArticleBottomSheet(
    BuildContext context, {
    required String image,
    required String title,
    required String url,
  }) {
    return showModalBottomSheet(
      backgroundColor: context.secondaryTheme,
      context: context,
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(image),
                ),
              const SizedBox(height: 8),
              Text(title, style: sheetContext.textTheme.labelMedium),
              Spacer(),
              InkWell(
                onTap: () {
                  openUrl(context: context, link: url);
                },
                child: const CustomContainerNews(),
              ),
            ],
          ),
        );
      },
    );
  }

  
  void openUrl({required BuildContext context, required String link}) async {
  if (link.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('الرابط غير متوفر'),
      ),
    );
    return;
  }

  final Uri url = Uri.parse(link);

  await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
}

}
