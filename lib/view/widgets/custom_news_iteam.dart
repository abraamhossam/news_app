import 'package:flutter/material.dart';

import 'package:news_app/model/news_iteam_model.dart';
import 'package:news_app/utils/assets.dart';

class CustomNewsIteam extends StatelessWidget {
  const CustomNewsIteam({
    super.key,
    required this.model,
  });
  final NewsIeamModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: model.image != null
                ? Image.network(
                    model.image!,
                  )
                : Image.asset(Assets.testImage),
          ),
          Text(
            model.title ?? " ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            model.subTitle ?? " ",
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
