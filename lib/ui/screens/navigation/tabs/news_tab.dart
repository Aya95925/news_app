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
  late Future<List<Source>> sourcesFuture;

  @override
  void initState() {
    super.initState();

    sourcesFuture = ApiManager.loadSources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        title: const Text('General'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search, size: 32),
          ),
        ],
      ),
      body: FutureBuilder<List<Source>>(
        future: sourcesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return ErrorWidgetNews(error: snapshot.error.toString());
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return buildTabBar(snapshot.data!);
          }

          return const Center(child: Text("No Sources Found"));
        },
      ),
    );
  }

  Widget buildTabBar(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: sources
                .map((source) => Tab(text: source.name ?? "default"))
                .toList(),
          ),
          SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => NewsListView(source: source))
                  .toList(),
            ),
          ),
        ],
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
            decoration: const BoxDecoration(color: AppColors.white),
            child: Center(child: Text('News App', style: AppStyle.black24Bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Icon(Icons.home_outlined, color: AppColors.white, size: 28),
                    SizedBox(width: 4),
                    Text('Go To Home', style: AppStyle.white20bold),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.white),
                const SizedBox(height: 24),
                const Text('Theme'),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      iconSize: 38,
                      isExpanded: true,
                      value: 'dark',
                      style: AppStyle.black14Medium.copyWith(fontSize: 18),
                      items: const [
                        DropdownMenuItem(value: 'light', child: Text('Light')),
                        DropdownMenuItem(value: 'dark', child: Text('Dark')),
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
