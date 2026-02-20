import 'package:flutter/material.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_routes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, AppRoutes.navigation);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Image.asset( themeProvider.isLight?AppAssets.splashLight:
        AppAssets.splashDark,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
