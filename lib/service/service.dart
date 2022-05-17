import 'dart:convert';

import 'package:news_app/model/model.dart';
import 'package:http/http.dart' as http;

String apiKey = '0d867713f8d94bbb9f6be8d3d1181043';
String baseUrl = 'https://newsapi.org/v2';

class News{
  Future<List<Article>?> getNews() async{
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      return list;
    }else{
      throw Exception('Tidak dapat mengambil data berita');
    }

  }

  Future<List<Article>?> getNewsByCategories(String category) async{
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();
      return list;
    }else{
      throw Exception('Tidak dapat mengambil data Category');
    }
  }
}