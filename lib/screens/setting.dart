import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/services/posts/get_post.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  late Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<Post>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data?.title ?? '');
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
