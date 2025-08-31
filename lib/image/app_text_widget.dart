import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  const AppTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
