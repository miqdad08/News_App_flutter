import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/service/service.dart';
import 'package:news_app/widget/news_item.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> articles;
  const TabBarMenu({Key? key, required this.articles}) : super(key: key);

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  List<Tab> myTab = [
    Tab(text : 'Business'
    ),
    Tab(text : 'Entertainment'
    ),
    Tab(text : 'General'
    ),
    Tab(text : 'Health'
    ),
    Tab(text : 'Science'
    ),
    Tab(text : 'Sports'
    ),
    Tab(text : 'Technology'
    ),
  ];

  @override
  void initState() {
    _tabController  = TabController(length: myTab.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var news = News();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: myTab,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            indicator: BubbleTabIndicator(
              indicatorHeight: 30.0,
              indicatorColor: Colors.black,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: myTab.map((Tab tab){
                return FutureBuilder(
                  future: news.getNewsByCategories(tab.text.toString()),
                    builder: (context, snapshot)=>
                    snapshot.data != null
                    ? _listNewsCategory(snapshot.data as List<Article>) :
                    Center(child: CircularProgressIndicator())
                );
              }).toList()
            ),
          )
        ],
      ),
    );
  }

  Widget _listNewsCategory(List<Article> article){
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(itemBuilder: (context, index) => NewsItem(article: article[index]),
      itemCount: article.length,
      ),
    );
  }
}
