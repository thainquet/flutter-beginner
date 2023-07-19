import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.goNamed("setting");
        },
        child: Text('Go setting'));
  }
}
