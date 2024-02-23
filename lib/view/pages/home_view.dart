import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_view_controller.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/size_config.dart';
import 'package:news_app/view/widgets/category_list_view.dart';
import 'package:news_app/view/widgets/custom_news_iteam.dart';
import 'package:news_app/view/widgets/news_app_title.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  static String id = "/homeview";
  final List<CategoryModel> listData = [
    CategoryModel(
      categoryName: "business",
      image: "assets/images/business.jpg",
    ),
    CategoryModel(
      categoryName: "entertainment",
      image: "assets/images/entertaiment.jpg",
    ),
    CategoryModel(
      categoryName: "general",
      image: "assets/images/general.jpg",
    ),
    CategoryModel(
      categoryName: "health",
      image: "assets/images/health.webp",
    ),
    CategoryModel(
      categoryName: "science",
      image: "assets/images/science.jpg",
    ),
    CategoryModel(
      categoryName: "sports",
      image: "assets/images/sports.jpg",
    ),
    CategoryModel(
      categoryName: "technology",
      image: "assets/images/technology.webp",
    ),
  ];
  final HomeViewController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.getNews(categoryName: "general");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const NewsAppTitle(size1: 22, size2: 24),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: CategoryListView(listData: listData),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: SizeConfig.height! * 0.02,
              ),
            ),
            GetX<HomeViewController>(
              builder: (controller) {
                if (controller.state.value == 'success') {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.model.length,
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomNewsIteam(
                            model: controller.model[index],
                          ),
                        );
                      },
                    ),
                  );
                } else if (controller.state.value == 'faliure') {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text("Oops there is an error"),
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
