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
            return Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                    child: Column(
                  children: [
                    Text(snapshot.data?.title ?? ""),
                    Text(snapshot.data?.description ?? "asdssd"),
                  ],
                )));
          } else if (snapshot.hasError) {
            return Align(
              alignment: Alignment.topLeft,
              child: SafeArea(child: Text('${snapshot.error}')),
            );
          }
          return SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          );
        },
      ),
    );
  }
}
