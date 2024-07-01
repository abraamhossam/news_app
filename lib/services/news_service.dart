import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_iteam_model.dart';

class NewsService {
  String apiKey = "fa718fa167c94617afc375f67da3229d";
  String country = "us";

  Future<List<NewsIteamModel>> getNews({required String category}) async {
    try {
      List<NewsIteamModel> listData = [];
      Uri url = Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> jsonData = data["articles"];
      for (int index = 0; index < jsonData.length; index++) {
        listData.add(NewsIteamModel.fromJson(jsonData[index]));
      }
      return listData;
    } catch (e) {
      return [];
    }
  }
}
