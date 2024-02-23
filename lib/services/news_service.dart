import 'package:dio/dio.dart';
import 'package:news_app/model/news_iteam_model.dart';

class NewsService {
  final Dio dio = Dio();
  Future<List<NewsIeamModel>> getNews(
      {required String countryName, required String category}) async {
    try {
      String baseUrl = "https://newsapi.org/v2";
      String apiKey = "fa718fa167c94617afc375f67da3229d";
      Response response = await dio.get(
          "$baseUrl/top-headlines?country=$countryName&category=$category&apiKey=$apiKey");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> listArticles = jsonData["articles"];
      List<NewsIeamModel> listData = [];
      for (int i = 0; i < listArticles.length; i++) {
        listData.add(
          NewsIeamModel.fromjson(
            listArticles[i],
          ),
        );
      }

      return listData;
    } catch (e) {
      return [];
    }
  }
}
