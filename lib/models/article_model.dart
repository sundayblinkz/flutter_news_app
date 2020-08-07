class ArticleModel {
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  DateTime publishedAt;

  ArticleModel(
      {this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.publishedAt});
}
