import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/helper/size_config.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/view/widgets/news_iteam.dart';

class NewsTypeViewBody extends StatelessWidget {
  const NewsTypeViewBody({
    super.key,
    required this.newsType,
  });
  final String newsType;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return CustomScrollView(
      slivers: [
        FutureBuilder(
          future: NewsService().getNews(
            category: newsType,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: SizeConfig.height! / 1.2,
                    child: const Center(
                      child: Text(
                        "OOps, there is an error",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
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
              }
            } else if (snapshot.hasError) {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: SizeConfig.height! / 1.2,
                  child: const Center(
                    child: Text(
                      "OOps, there is an error",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: SizeConfig.height! / 1.2,
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
