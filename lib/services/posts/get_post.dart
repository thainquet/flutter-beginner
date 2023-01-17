import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/post.dart';
import 'dart:convert';

Future<Post> getPost() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
