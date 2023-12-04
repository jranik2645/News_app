import 'package:flutter/material.dart';
import 'package:news_app/ui/all_news.dart';
import 'package:news_app/ui/breaking_news.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 2, child: Scaffold(
       appBar: AppBar(
          title:  Center(child: Text('Flutter News app',style: TextStyle(fontWeight: FontWeight.bold),)),
          bottom: const TabBar(tabs: [
             Tab(text: "Breaking",),
              Tab(text: "All News",)
          ]),
       ),
        body: const TabBarView(
           children: [
            BreakingNews(),
             AllNews(),
           ],
        ),

    ),
    );
  }
}
