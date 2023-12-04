import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/news_model.dart';

class ApiService{
     final all_news_url=
         "https://newsapi.org/v2/everything?q=bitcoin&apiKey=2a9acc68e3684eb89bca4b804c1eef27";

      final  breaking_news_url=
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=2a9acc68e3684eb89bca4b804c1eef27";

     Future<List<NewsModel>> getAllNews() async {
     try {
     Response response = await get(Uri.parse(all_news_url));
     if (response.statusCode == 200) {
     Map<String, dynamic> json = jsonDecode(response.body);
     List<dynamic> body = json['articles'];
     List<NewsModel> articlesList =
     body.map((dynamic item) => NewsModel.fromJson(item)).toList();
     return articlesList;
     } else {
     throw ("No artile found");
     }
     } catch (e) {
     throw (e.toString());
     }
     }

     Future<List<NewsModel>> getBreakingNews() async {
     try {
     Response response = await get(Uri.parse(breaking_news_url));
     if (response.statusCode == 200) {
     Map<String, dynamic> json = jsonDecode(response.body);
     List<dynamic> body = json['articles'];
     List<NewsModel> articlesList =
     body.map((dynamic item) => NewsModel.fromJson(item)).toList();
     return articlesList;
     } else {
     throw ("No artile found");
     }
     } catch (e) {
     throw (e.toString());
     }
     }
     }