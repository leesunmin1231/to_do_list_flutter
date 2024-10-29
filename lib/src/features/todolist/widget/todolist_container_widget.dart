import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:to_do_list/src/core/hooks/use_custom_state.dart';

class TodoListContainerWidget extends HookWidget {
  const TodoListContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final [todoListState, setTodoListState] = useCustomState([]);

    void submitHandler(e) {
      setTodoListState([...todoListState, e]);
      controller.clear();
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
            ...todoListState.map((ele) => Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1))),
                  child: Text(ele),
                ))
          ],
        )));
  }
}
