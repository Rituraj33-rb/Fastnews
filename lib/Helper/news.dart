import 'dart:convert';

import 'package:news/models/artical_model.dart';
import 'package:http/http.dart'as http;
class News{
  String apiKey = "9efa7a906d294745bee53298f900dbec";
  List<ArticalModel>news=[];
  Future<void>getNews() async{
    String url="http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=${apiKey}";
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if (jsonData['status']=="ok"){
      jsonData['articles'].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null){
          ArticalModel articalModel=ArticalModel(
              title: element['title'],
              author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            // publishedAt: DateTime.parse(element['publishedAt']),
            url: element["url"],
            content: element["context"],
          );
          news.add(articalModel);
        }
      });
    }
  }
}
class CategoryNewsClass{
  String apiKey = "9efa7a906d294745bee53298f900dbec";
  List<ArticalModel>news=[];
  Future<void>getNews(String category) async{
    String url="http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if (jsonData['status']=="ok"){
      jsonData['articles'].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null){
          ArticalModel articalModel=ArticalModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            // publishedAt: DateTime.parse(element['publishedAt']),
            url: element["url"],
            content: element["context"],
          );
          news.add(articalModel);
        }
      });
    }
  }
}
