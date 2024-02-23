import 'package:get/get.dart';
import 'package:news_app/services/news_service.dart';

class CategoryViewController extends GetxController {
  List<dynamic> model = [];
  RxString state = ''.obs;
  getNews({required String categoryName}) async {
    state.value = 'loading';
    try {
      model = await NewsService()
          .getNews(countryName: "us", category: categoryName);
      state.value = 'success';
    } catch (e) {
      state.value = 'failure';
    }
  }
}
