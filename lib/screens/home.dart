import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Material(
        child: Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
                child: Column(children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'Type sth', labelText: 'Text input'),
              ),
              ElevatedButton(
                onPressed: () => context.goNamed('setting'),
                child: const Text('Submit'),
              ),
            ]))));
  }
}
