import 'package:flutter/material.dart';
import 'package:to_do_list/src/core/components/top_bar.dart';
import 'package:to_do_list/src/features/todolist/widget/todolist_container_widget.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: TopBar(
          appTitle: "To do list",
        ),
        body: Center(child: TodoListContainerWidget()));
  }
}
