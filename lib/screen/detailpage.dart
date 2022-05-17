import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailPage extends StatefulWidget {
  final Article article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.article.urlToImage,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(height: 330),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          widget.article.title,
                          style: titleArticle.copyWith(fontSize: 18),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.account_circle,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  widget.article.author,
                                  style:
                                  authorDateArticle.copyWith(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined),
                                SizedBox(width: 15,),
                                Text(time(
                                    DateTime.parse(widget.article.publishedAt)),
                                  style: authorDateArticle.copyWith(
                                      fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text(widget.article.content,
                          style: detailArticle.copyWith(fontSize: 16.0),),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0,10),
                            blurRadius: 50
                          )
                        ]
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0,10),
                              blurRadius: 50
                          )
                        ]
                    ),
                    child: IconButton(
                      onPressed: (){
                      },
                      icon: Icon(Icons.bookmark_border_rounded),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String time(DateTime parse) {
    return timeago.format(parse, allowFromNow: true, locale: 'id');
  }

}
