import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
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
            fontWeight: FontWeight.bold,
            fontSize: size1,
          ),
        ),
        Text(
          "Cloud",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size2,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
