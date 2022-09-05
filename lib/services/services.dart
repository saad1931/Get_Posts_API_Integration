import 'package:http/http.dart' as http;
import 'package:restapi/models/models.dart';

import 'dart:convert';

getPosts() async {
  List postlist = [];
  String url = "https://jsonplaceholder.typicode.com/posts";
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body.toString());
  
  

  for (var i in data) {
    postlist.add(post_model.fromJson(i));
  }
  return postlist;
}