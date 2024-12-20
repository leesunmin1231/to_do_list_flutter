import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/src/store/todolist/todolist_notifier.dart';

class TodolistInputWidget extends ConsumerWidget {
  final controller = TextEditingController();

  TodolistInputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void submitHandler(String text) {
      if (text.isNotEmpty) {
        ref.read(todoListNotifierProvider.notifier).addTodo(content: text);
        controller.clear(); // Clear text field after submission
      }
    }

    return TextField(
      style: const TextStyle(fontSize: 15),
      textAlign: TextAlign.start,
      controller: controller,
      textInputAction: TextInputAction.send,
      onSubmitted: submitHandler,
      decoration: const InputDecoration(
          labelText: '무엇을 해야하나요?',
          prefixIcon: Icon(Icons.input_rounded),
          border: OutlineInputBorder()),
    );
  }
}
