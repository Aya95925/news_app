import 'package:flutter/material.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/ui/utils/app_color.dart';
import 'package:news_app/ui/utils/app_style.dart';
import 'package:provider/provider.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .25,
            decoration: const BoxDecoration(color: AppColors.white),
            child: Center(
              child: Text(
                'News App',
                style: AppStyle.black24Bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Icon(Icons.home_outlined,
                        color: AppColors.white, size: 28),
                    SizedBox(width: 4),
                    Text('Go To Home',
                        style: AppStyle.white20bold),
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
                    child: DropdownButton<ThemeMode>(
                      iconSize: 38,
                      isExpanded: true,
                      value: themeProvider.theme,
                      style: AppStyle.black14Medium.copyWith(fontSize: 18),
                      items: const [
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text('Light'),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text('Dark'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          themeProvider.updateTheme(value);
                        }
                      },
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
