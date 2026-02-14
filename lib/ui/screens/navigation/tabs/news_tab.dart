import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/models/source_response/source.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_list_view.dart';
import 'package:news_app/ui/utils/app_color.dart';
import 'package:news_app/ui/utils/app_style.dart';
import 'package:news_app/widget/_news.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        title: Text('General'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.search, size: 32),
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: ApiManager.loadSources(),
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                print('${snapShot.error.toString()}');
                return ErrorWidgetNews(error: snapShot.error.toString());
              } else if (snapShot.hasData) {
                return buildTabBar(snapShot.data!);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Expanded(child: NewsListView()),
        ],
      ),
    );
  }

  DefaultTabController buildTabBar(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        tabs: sources
            .map((source) => Tab(child: Text(source.name ?? 'default')))
            .toList(),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .25,
            decoration: BoxDecoration(color: AppColors.white),
            child: Center(child: Text('News App', style: AppStyle.black24Bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: AppColors.white,
                        size: 28,
                      ),
                      SizedBox(width: 4),
                      Text('Go To Home', style: AppStyle.white20bold),
                    ],
                  ),
                ),
                Divider(color: AppColors.white),
                SizedBox(height: 24),
                Text('Theme'),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      iconSize: 38,

                      isExpanded: true,
                      value: 'dark',
                      style: AppStyle.black14Medium.copyWith(fontSize: 18),
                      items: [
                        DropdownMenuItem(value: 'light', child: Text('Light')),
                        DropdownMenuItem(value: 'dark', child: Text('dark')),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
