

import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/navigation/tabs/news_tab.dart';

abstract final class AppRoutes {
  static MaterialPageRoute get navigation => MaterialPageRoute(
        builder: (context) => const NewsTab(),
      );
}
