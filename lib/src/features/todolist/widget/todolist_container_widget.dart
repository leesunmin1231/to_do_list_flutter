import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/src/features/todolist/widget/todolist_input_widget.dart';
import 'package:to_do_list/src/features/todolist/widget/todolist_widget.dart';

class TodoListContainer extends ConsumerStatefulWidget {
  const TodoListContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TodoListContainerState();
  }
}

class _TodoListContainerState extends ConsumerState<TodoListContainer> {
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
