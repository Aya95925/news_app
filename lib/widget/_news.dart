import 'package:flutter/material.dart';

class ErrorWidgetNews extends StatelessWidget {
  final String error;
  const ErrorWidgetNews({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}
