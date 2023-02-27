class ArticleModel{
  ArticleModel({required this.title, required this.description, required this.author,
    required this.content, required this.urlToImage, required this.url});

  late String title;
  late String author;
  late String description;
  late String url;
  late String urlToImage;
  late String content;
}