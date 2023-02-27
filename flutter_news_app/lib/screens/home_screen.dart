import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/data.dart';
import 'package:flutter_news_app/widgets/blog_tile.dart';
import 'package:flutter_news_app/widgets/category_tile.dart';
import '../helper/news.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;


  @override
  void initState() {
    categories = getCategories();
    getNews();
    super.initState();
  }

  void getNews() async {
    News news = News();
    await news.getNews();
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
      ),
      body:  _loading? Center(child: Container(child: const CircularProgressIndicator(),)) :
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index){
                    return CategoryTile(imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
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
                  itemCount: articles.length,
                ),
              )
            ],
          ),

        ),
      ),
    );
  }

}
