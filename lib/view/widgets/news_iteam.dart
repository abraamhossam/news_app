import 'package:flutter/material.dart';
import 'package:news_app/helper/size_config.dart';
import 'package:news_app/model/news_iteam_model.dart';

class NewsIteam extends StatelessWidget {
  const NewsIteam({
    super.key,
    required this.model,
  });
  final NewsIteamModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Column(
        children: [
          model.image == null
              ? Container(
                  height: SizeConfig.height! * 0.28,
                  width: SizeConfig.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/error-image.png"),
                    ),
                  ),
                )
              : Container(
                  height: SizeConfig.height! * 0.28,
                  width: SizeConfig.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(model.image!),
                    ),
                  ),
                ),
          SizedBox(
            height: SizeConfig.height! * 0.01,
          ),
          Text(
            model.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: SizeConfig.height! * 0.005,
          ),
          Text(
            model.subTitle == null ? "" : model.subTitle!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
