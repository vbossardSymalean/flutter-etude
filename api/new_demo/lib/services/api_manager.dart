import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_demo/constants/strings.dart';
import 'package:new_demo/models/newsInfo.dart';

class Api_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
          var response = await client.get(Uri.parse(Strings.news_url));
    if (response.statusCode == 200) {
      // Data to bind to a model => faire avec quicktype
      var jsonString = response.body;
      var jsonMap = jsonDecode(jsonString);
      newsModel = NewsModel.fromJson(jsonMap);
    }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
