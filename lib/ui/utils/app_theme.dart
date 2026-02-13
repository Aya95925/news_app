import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_color.dart';
import 'package:news_app/ui/utils/app_style.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarThemeData(
      actionsIconTheme: IconThemeData(color: AppColors.black, ),
      backgroundColor: AppColors.white,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppStyle.white20medium.copyWith(color: AppColors.black),
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColors.black,
      unselectedLabelStyle: AppStyle.black14Medium,
      labelStyle: AppStyle.white16Bold.copyWith(color: AppColors.black),
      dividerColor: Colors.transparent,
    ),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.black),
  
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.black),
  );
}
