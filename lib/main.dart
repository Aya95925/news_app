import 'package:flutter/material.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_tab.dart';
import 'package:news_app/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsTab(),
      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.theme,

      // themeMode: ,
    );
  }
}
