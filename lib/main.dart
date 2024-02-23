import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:news_app/utils/my_bindings.dart';
import 'package:news_app/view/pages/category_view.dart';

import 'package:news_app/view/pages/home_view.dart';
import 'package:news_app/view/pages/splash_view.dart';

void main() {
  return runApp(
    const NewsApp(),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      initialRoute: SplashView.id,
      getPages: [
        GetPage(
          name: SplashView.id,
          page: () => const SplashView(),
        ),
        GetPage(
          name: HomeView.id,
          page: () => HomeView(),
        ),
        GetPage(
          name: CategoryView.id,
          page: () => CategoryView(),
        ),
      ],
    );
  }
}
