import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/animation_text.dart';
import 'package:news_app/view/widgets/app_title.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppTitle(
            size1: 50,
            size2: 56,
          ),
          AnimationText(
            slidingAnimation: slidingAnimation,
          ),
        ],
      ),
    );
  }
}
