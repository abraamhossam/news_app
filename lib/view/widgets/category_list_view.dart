import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/size_config.dart';
import 'package:news_app/view/pages/category_view.dart';
import 'package:news_app/view/widgets/custom_category_iteam.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
    required this.listData,
  });

  final List<CategoryModel> listData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height! * 0.12,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: listData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCategoryIteam(
            model: listData[index],
            ontap: () {
              Get.toNamed(
                CategoryView.id,
                arguments: listData[index].categoryName,
              );
            },
          );
        },
      ),
    );
  }
}
