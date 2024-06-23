import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/app_title.dart';
import 'package:news_app/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "/HomeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(
          size1: 26,
          size2: 28,
        ),
      ),
      body: HomeViewBody(),
    );
  }
}
