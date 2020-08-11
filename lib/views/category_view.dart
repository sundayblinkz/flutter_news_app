import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_24/helper/news.dart';
import 'package:news_24/models/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(fontSize: 25.0),
            ),
            Text(
              '19',
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                              publishedAt: DateFormat.Hm()
                                  .format(articles[index].publishedAt),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url, publishedAt;
  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.desc,
    @required this.url,
    @required this.publishedAt,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          child: Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          topLeft: Radius.circular(4)),
                      child: Image.network(imageUrl)),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      height: 50.0,
                      child: Text(
                        desc,
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Text(
                          publishedAt,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
