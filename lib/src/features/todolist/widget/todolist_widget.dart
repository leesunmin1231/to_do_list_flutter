import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    List<String> todoList = ref.watch(todoListNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...todoList.asMap().entries.map((ele) => InkWell(
            onTap: () => context.push('/tododetail?id=${ele.key}'),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1))),
              child: Text(ele.value),
            )))
      ],
    );
  }
}
