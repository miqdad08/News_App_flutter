import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/widget/carousel_widget.dart';
import 'package:news_app/widget/tabbar_menu.dart';

class NewsPage extends StatefulWidget {
  final List<Article> article;
  const NewsPage({Key? key, required this.article}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 10),
          child: Text('Berita Heboh', style: titleHome)),

          CarouselWidget(articleList: widget.article),
          TabBarMenu(articles: widget.article),
        ],
      ),
    );
  }
}
