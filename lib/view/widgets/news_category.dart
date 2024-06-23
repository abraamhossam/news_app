import 'package:flutter/material.dart';
import 'package:news_app/helper/size_config.dart';
import 'package:news_app/model/news_category_model.dart';

class NewsCategory extends StatelessWidget {
  const NewsCategory({
    super.key,
    required this.model,
    this.ontap,
  });
  final NewsCategoryModel model;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 8,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: SizeConfig.width! * 0.44,
          height: SizeConfig.height! * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(model.categoryImage),
            ),
          ),
          child: Center(
            child: Text(
              model.categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
