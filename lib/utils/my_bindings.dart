import 'package:get/get.dart';
import 'package:news_app/controller/category_view_controller.dart';
import 'package:news_app/controller/home_view_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewController());
    Get.put(CategoryViewController());
  }
}
