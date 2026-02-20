import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_color.dart';
import 'package:news_app/ui/utils/app_style.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white,
      secondary: AppColors.black,
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyle.black24Bold.copyWith(fontWeight: FontWeight.w500),
      labelLarge: AppStyle.black16Bold,
      labelMedium: AppStyle.black14Medium,
      labelSmall: AppStyle.grey12Medium,
      titleMedium: AppStyle.black14Medium.copyWith(fontSize: 20),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.black),
      // actionsIconTheme: IconThemeData(color: AppColors.black),
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
    primaryColor: AppColors.black,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
      secondary: AppColors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: AppStyle.white24Medium,
      titleMedium: AppStyle.white20medium,

      labelLarge: AppStyle.white16Bold,
      labelMedium: AppStyle.white14medium,
      labelSmall: AppStyle.grey12Medium,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      // actionsIconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.black,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppStyle.white20medium,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorColor: AppColors.white,
      unselectedLabelStyle: AppStyle.white14medium,
      labelStyle: AppStyle.white16Bold,
      dividerColor: Colors.transparent,
    ),
  );
}
