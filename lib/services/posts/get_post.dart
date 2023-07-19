import 'package:flutter_application_1/models/post.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<Post> getPost() async {
  final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  if (response.statusCode == 200) {
    return Post.fromJson(response.data);
  } else {
    throw Exception('Failed to load post');
  }
}
