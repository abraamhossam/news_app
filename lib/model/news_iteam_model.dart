class NewsIteamModel {
  final String title;
  final String? subTitle;
  final String? image;

  NewsIteamModel({
    required this.title,
    this.subTitle,
    this.image,
  });
  factory NewsIteamModel.fromJson(dynamic data) {
    return NewsIteamModel(
      title: data["title"],
      subTitle: data["description"],
      image: data["urlToImage"],
    );
  }
}
