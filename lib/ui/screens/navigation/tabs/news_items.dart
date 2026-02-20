import 'package:flutter/material.dart';
import 'package:news_app/models/article_response/article.dart';

import 'package:news_app/ui/utils/app_style.dart';
import 'package:news_app/ui/utils/extension/context_extension.dart';

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
        decoration: BoxDecoration(
          border: Border.all(color: context.secondaryTheme),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.network(
              height: MediaQuery.of(context).size.height * .2,
              width: double.infinity,
              article.urlToImage ?? '',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(article.title ?? '', style: context.textTheme.labelLarge),
            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: Text(
                    'by:${article.author}',
                    style: AppStyle.grey12Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
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
