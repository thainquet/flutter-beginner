import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.goNamed('setting');
        },
        child: Text('Go setting'));
  }
}
