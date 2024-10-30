import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/src/store/todolist/todo_entity.dart';
import 'package:to_do_list/src/store/todolist/todolist_notifier.dart';

class TodolistWidget extends ConsumerStatefulWidget {
  const TodolistWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TodolistWidgetState();
  }
}

class _TodolistWidgetState extends ConsumerState<TodolistWidget> {
  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = ref.watch(todoListNotifierProvider);
    void deleteHandler(String id) {
      ref.read(todoListNotifierProvider.notifier).deleteTodo(id: id);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...todoList.where((target) => !target.isDelete).map((todo) => InkWell(
            onTap: () => context.push('/tododetail?id=${todo.id}'),
            child: Container(
              padding: const EdgeInsets.only(left: 5.0),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(todo.content),
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => deleteHandler(todo.id),
                      iconSize: 20,
                      icon: const Icon(Icons.cancel_outlined))
                ],
              ),
            )))
      ],
    );
  }
}
