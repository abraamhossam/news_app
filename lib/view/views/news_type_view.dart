import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/app_title.dart';
import 'package:news_app/view/widgets/news_type_view_body.dart';

class NewsTypeView extends StatelessWidget {
  const NewsTypeView({
    super.key,
  });
  static String id = "/NewsTypeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(
          size1: 26,
          size2: 28,
        ),
      ),
      body: NewsTypeViewBody(
        newsType: Get.arguments,
      ),
    );
  }
}
