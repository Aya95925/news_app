import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/models/source_response/source.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_list_view.dart';
import 'package:news_app/ui/utils/extension/context_extension.dart';
import 'package:news_app/widget/build_drawer.dart';
import 'package:news_app/widget/error_widget_news.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late Future<List<Source>> sourcesFuture;
  late ThemeProvider themeProvider;
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  String? searchQuery;

  @override
  void initState() {
    super.initState();

    sourcesFuture = ApiManager.loadSources();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      drawer: isSearching ? null : const BuildDrawer(),
      appBar: AppBar(
        title: isSearching ? customTextField() : const Text('General'),
        actions: isSearching
            ? []
            : [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: IconButton(
                    onPressed: () {
                      isSearching = true;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.search,
                      size: 32,
                      color: context.secondaryTheme,
                    ),
                  ),
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
                  .map(
                    (source) =>
                        NewsListView(source: source, query: searchQuery),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextField() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryTheme),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: TextFormField(
          style: TextStyle(color: context.secondaryTheme),
          controller: searchController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',

            hintStyle: context.textTheme.titleMedium,
            border: InputBorder.none,
          ),
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
            setState(() {
              searchQuery = value;
              isSearching = false;
            });
          },
        ),
      ),
    );
  }
}
