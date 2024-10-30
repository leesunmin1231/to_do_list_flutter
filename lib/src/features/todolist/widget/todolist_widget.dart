import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_list/src/features/todolist/widget/todo_item.dart';
import 'package:to_do_list/src/store/todolist/todo_entity.dart';
import 'package:to_do_list/src/store/todolist/todolist_notifier.dart';

class TodolistWidget extends ConsumerWidget {
  const TodolistWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todoList = ref.watch(todoListNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...todoList
            .where((target) => !target.isDelete)
            .map((todo) => TodoItem(todo: todo))
      ],
    );
  }
}
