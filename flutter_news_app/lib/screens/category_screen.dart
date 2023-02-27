import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/news.dart';

import '../models/article_model.dart';
import '../widgets/blog_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.newsCategory}) : super(key: key);

  final String newsCategory;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    CategoryNews news = CategoryNews();
    await news.getNewsForCategory(widget.newsCategory);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Flutter", style: TextStyle(color: Colors.black),),
            Text("News", style: TextStyle(color: Colors.blue),)
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.save),
            ),
          )
        ],
      ),
      body: _loading? Center(child: Container(child: const CircularProgressIndicator(),)) :
      SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          child: ListView.builder(
              itemCount: articles.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index){
                return BlogTile(
                  imageUrl: articles[index].urlToImage,
                  title: articles[index].title,
                  desc: articles[index].description,
                  url: articles[index].url,
                );
              },
          ),
        ),
      ),
    );
  }
}
