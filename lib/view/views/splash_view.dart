import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/main.dart';
import 'package:news_app/view/views/home_view.dart';
import 'package:news_app/view/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = "/SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animatationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }

  void initSlidingAnimation() {
    animatationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animatationController);
    animatationController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      sharedPrefs?.setString("frist_reg", "true");
      Get.offNamed(HomeView.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animatationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(
        slidingAnimation: slidingAnimation,
      ),
    );
  }
}
