import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/views/home_view.dart';
import 'package:news_app/view/views/news_type_view.dart';
import 'package:news_app/view/views/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPrefs;
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
      initialRoute: sharedPrefs?.getString("frist_reg") == "true"
          ? HomeView.id
          : SplashView.id,
      getPages: [
        GetPage(
          name: SplashView.id,
          page: () => const SplashView(),
        ),
        GetPage(
          name: HomeView.id,
          page: () => const HomeView(),
        ),
        GetPage(
          name: NewsTypeView.id,
          page: () => const NewsTypeView(),
        ),
      ],
    );
  }
}
