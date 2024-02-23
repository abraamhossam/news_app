import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/category_view_controller.dart';
import 'package:news_app/utils/size_config.dart';

import 'package:news_app/view/widgets/custom_news_iteam.dart';
import 'package:news_app/view/widgets/news_app_title.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});
  static String id = "/categoryview";
  final CategoryViewController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.getNews(categoryName: Get.arguments);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const NewsAppTitle(
            size1: 22,
            size2: 24,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: SizeConfig.height! * 0.01,
              ),
            ),
            GetX<CategoryViewController>(
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
