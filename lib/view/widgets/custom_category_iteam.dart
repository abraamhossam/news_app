import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/size_config.dart';

class CustomCategoryIteam extends StatelessWidget {
  const CustomCategoryIteam({
    super.key,
    required this.model,
    required this.ontap,
  });
  final CategoryModel model;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12,
        ),
        child: SizedBox(
          width: SizeConfig.width! * 0.38,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(model.image),
                ),
              ),
              child: Center(
                child: Text(
                  model.categoryName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
