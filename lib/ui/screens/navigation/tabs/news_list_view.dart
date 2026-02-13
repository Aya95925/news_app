import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_items.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(padding: const EdgeInsets.only(right: 16,left: 15,bottom: 16), child: NewsItems());
      },
    );
  }
}
