import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/src/core/components/top_bar.dart';
import 'package:to_do_list/src/features/todolist/providers/todolist_notifier.dart';

class TododetailPage extends ConsumerWidget {
  const TododetailPage(this.id, {super.key});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> todoList = ref.watch(todoListNotifierProvider);
    return Scaffold(
        appBar: const TopBar(
          appTitle: "To do content",
          backButton: true,
        ),
        body: Center(
            child: id == null
                ? const Text('투두 상세를 볼 수 없습니다.')
                : Text(todoList[id!])));
  }
}
