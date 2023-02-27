import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_news_app/helper/secret.dart';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

 Future<void> getNews()async {
      try{
        var url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";
        var response = await http.get(Uri.parse(url));
        var jsonData = jsonDecode(response.body);

        if(jsonData['status'] == "ok"){
          jsonData["articles"].forEach((element){
            if(element['description']!= null){
              ArticleModel articleModel = ArticleModel(
                title: element['title'] ?? "",
                description: element['description'] ?? "",
                author: element['author'] ?? "",
                content: element['content'] ?? "",
                urlToImage: element['urlToImage'] ?? "",
                url: element['url'] ?? "",
              );
              news.add(articleModel);
            }
            else{
              if (kDebugMode) {
                print("ERROR in loading");
              }
            }
          });
        }
        else{
          if (kDebugMode) {
            print('ERROR in response');
          }
        }

      }catch(e){
        if (kDebugMode) {
          print("error");
        }
        rethrow;
      }
 }

}

class CategoryNews{

  List<ArticleModel> news  = [];

  Future<void> getNewsForCategory(String category) async{
    try{
      String url = "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey";

      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);

      if(jsonData['status'] == "ok"){
        jsonData["articles"].forEach((element){
          if(element['description']!= null && element['urlToImage']!= null){
            ArticleModel articleModel = ArticleModel(
              title: element['title'] ?? "",
              description: element['description'] ?? "",
              author: element['author'] ?? "",
              content: element['content'] ?? "",
              urlToImage: element['urlToImage'] ?? "",
              url: element['url'] ?? "",
            );
            news.add(articleModel);
          }
          else{
            if (kDebugMode) {
              print("ERROR in loading");
            }
          }
        });
      }
      else{
        if (kDebugMode) {
          print('ERROR in response');
        }
      }
    }catch(e){
      if (kDebugMode) {
        print("error");
      }
      rethrow;
    }

  }

}