import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/extension/context_extension.dart';

class CustomContainerNews extends StatelessWidget {
  const CustomContainerNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.primaryTheme,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text('View Full Article', style: context.textTheme.labelLarge),
        ),
      ),
    );
  }
}