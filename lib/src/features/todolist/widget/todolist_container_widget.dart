import 'package:flutter/material.dart';
import 'package:to_do_list/src/features/todolist/widget/todolist_input_widget.dart';
import 'package:to_do_list/src/features/todolist/widget/todolist_widget.dart';

class TodoListContainer extends StatelessWidget {
  const TodoListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        margin: const EdgeInsets.all(10.0),
        child: const Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TodolistInputWidget(),
            TodolistWidget(),
          ],
        )));
  }
}
