import 'package:flutter/material.dart';

class TododetailPage extends StatelessWidget {
  const TododetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "To do content",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(child: Text('second page')));
  }
}
