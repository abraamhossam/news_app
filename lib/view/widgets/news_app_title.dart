import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class NewsAppTitle extends StatelessWidget {
  const NewsAppTitle({
    super.key,
    required this.size1,
    required this.size2,
  });
  final double size1, size2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "News",
          style: TextStyle(
            fontSize: size1,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Cloud",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: size2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
