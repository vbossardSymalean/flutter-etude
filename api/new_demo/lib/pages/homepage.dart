import 'package:flutter/material.dart';
import 'package:new_demo/models/newsInfo.dart';
import 'package:new_demo/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = Api_Manager().getNews();
    print("La reposne : $_newsModel");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New App"),
        ),
        body: Container(
            child: FutureBuilder<NewsModel>(
                future: _newsModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.articles.length,
                        itemBuilder: (context, index) {
                          var article = snapshot.data.articles[index];
                          print(article.url);
                          return Container(
                              height: 100,
                              child: Row(
                                children: <Widget>[
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          article.urlToImage,
                                          fit: BoxFit.cover,
                                        )),
                                  )
                                  //Image.network(article.urlToImage),
                                ],
                              ));
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
