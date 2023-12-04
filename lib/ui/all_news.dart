import 'package:flutter/material.dart';
import 'package:news_app/Service/api_service.dart';
import 'package:news_app/model/news_model.dart';

import '../component/news_list_item.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
   ApiService apiService=ApiService();

 @override
     Widget build(BuildContext context){
     return Scaffold(
        body: FutureBuilder(
           future: apiService.getAllNews(),
          builder: (context, snapshot){
              if(snapshot.hasData){
                 List<NewsModel> articleList=snapshot.data ??[];
                 return ListView.builder(itemBuilder: (context, index){

                   return NewsItemList(newsModel: articleList[index],

                   );

                 },
                  itemCount: articleList.length,
                 );
              }
               return Center(
                  child: CircularProgressIndicator(),
               );
          }
        ),
     );
 }
 }
