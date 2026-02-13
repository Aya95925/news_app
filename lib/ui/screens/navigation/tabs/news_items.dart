import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_color.dart';
import 'package:news_app/ui/utils/app_style.dart';

class NewsItems extends StatelessWidget {
  const NewsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: AppColors.black)),
      child: Column(
        children: [
          Image.asset(
            height: MediaQuery.of(context).size.height *.2,
            width: double.infinity,
            AppAssets.splashLight,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
            style: AppStyle.black16Bold,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('data', style: AppStyle.grey12Medium),
              Spacer(),
              Text('Aya Ahmed', style: AppStyle.grey12Medium),
            ],
          ),
        ],
      ),
    );
  }
}
