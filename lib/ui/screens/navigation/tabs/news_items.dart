import 'package:flutter/material.dart';
import 'package:news_app/models/article_response/article.dart';
import 'package:news_app/ui/utils/app_color.dart';
import 'package:news_app/ui/utils/app_style.dart';

class NewsItems extends StatelessWidget {
  const NewsItems({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: AppColors.black)),
        child: Column(
          children: [
            Image.network(
              height: MediaQuery.of(context).size.height * .2,
              width: double.infinity,
              article.urlToImage ?? '',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(article.title ?? '', style: AppStyle.black16Bold),
            SizedBox(height: 10),
            Row(
              children: [
                Text('by:${article.author}', style: AppStyle.grey12Medium),
                Spacer(),
                Text('${article.publishedAt}', style: AppStyle.grey12Medium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
