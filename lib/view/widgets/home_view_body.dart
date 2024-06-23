import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/helper/size_config.dart';
import 'package:news_app/model/news_category_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/view/views/news_type_view.dart';
import 'package:news_app/view/widgets/news_category.dart';
import 'package:news_app/view/widgets/news_iteam.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});
  final List<NewsCategoryModel> listData = [
    NewsCategoryModel(
      categoryName: "sports",
      categoryImage: "assets/images/sports.jpg",
    ),
    NewsCategoryModel(
      categoryName: "business",
      categoryImage: "assets/images/business.jpg",
    ),
    NewsCategoryModel(
      categoryName: "entertainment",
      categoryImage: "assets/images/entertaiment.jpg",
    ),
    NewsCategoryModel(
      categoryName: "general",
      categoryImage: "assets/images/general.jpg",
    ),
    NewsCategoryModel(
      categoryName: "health",
      categoryImage: "assets/images/health.webp",
    ),
    NewsCategoryModel(
      categoryName: "science",
      categoryImage: "assets/images/science.jpg",
    ),
    NewsCategoryModel(
      categoryName: "technology",
      categoryImage: "assets/images/technology.webp",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: SizeConfig.height! * 0.18,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return NewsCategory(
                  ontap: () {
                    Get.toNamed(
                      NewsTypeView.id,
                      arguments: listData[index].categoryName,
                    );
                  },
                  model: listData[index],
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: SizeConfig.height! * 0.02,
          ),
        ),
        FutureBuilder(
          future: NewsService().getNews(
            category: 'general',
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: snapshot.data!.length,
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: NewsIteam(
                        model: snapshot.data![index],
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.height! * 0.3,
                ),
                child: const SliverToBoxAdapter(
                  child: Center(
                    child: Text("there is an error"),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: SizeConfig.height! / 1.6,
                  width: SizeConfig.width,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
