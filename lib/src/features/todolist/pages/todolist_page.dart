import 'package:flutter/material.dart';
import 'package:to_do_list/src/features/todolist/widget/todolist_container_widget.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "To do list",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(child: TodoListContainer()));
  }
}
