class NewsIeamModel {
  final String? image;
  final String? title;
  final String? subTitle;

  NewsIeamModel({
    this.image,
    this.title,
    this.subTitle,
  });

  factory NewsIeamModel.fromjson(dynamic data) {
    return NewsIeamModel(
      image: data["urlToImage"],
      title: data["title"],
      subTitle: data["description"],
    );
  }
}
