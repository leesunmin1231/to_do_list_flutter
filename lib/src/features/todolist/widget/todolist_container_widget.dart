import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list/src/configs/app_router.dart';
import 'package:to_do_list/src/features/todolist/providers/todolist_notifier.dart';

class TodoListContainer extends ConsumerStatefulWidget {
  const TodoListContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TodoListContainerState();
  }
}

class _TodoListContainerState extends ConsumerState<TodoListContainer> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> todoList = ref.watch(todoListNotifierProvider);
    void submitHandler(String text) {
      if (text.isNotEmpty) {
        ref.read(todoListNotifierProvider.notifier).addTodo(text);
        controller.clear(); // Clear text field after submission
      }
    }

    return Container(
        width: 300,
        margin: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
              controller: controller,
              textInputAction: TextInputAction.send,
              onSubmitted: submitHandler,
              decoration: const InputDecoration(
                  labelText: '무엇을 해야하나요?',
                  prefixIcon: Icon(Icons.input_rounded),
                  border: OutlineInputBorder()),
            ),
            ...todoList.map((ele) => InkWell(
                onTap: () => context.go('/tododetail'),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1))),
                  child: Text(ele),
                )))
          ],
        )));
  }
}
