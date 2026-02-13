import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_list_view.dart';
import 'package:news_app/ui/utils/app_color.dart';
import 'package:news_app/ui/utils/app_style.dart';

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
          DefaultTabController(
            length: 3,
            child: TabBar(
              tabs: [
                Tab(text: 'tab1'),
                Tab(text: 'tab2'),
                Tab(text: 'tab3'),
              ],
            ),
          ),
          Expanded(child: NewsListView()),
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
