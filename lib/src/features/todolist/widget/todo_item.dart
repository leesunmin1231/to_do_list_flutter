import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:to_do_list/src/core/hooks/use_custom_state.dart';
import 'package:to_do_list/src/store/todolist/todo_entity.dart';
import 'package:to_do_list/src/store/todolist/todolist_notifier.dart';

class TodoItem extends HookConsumerWidget {
  const TodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final [isUpdate, setIsUpdate] = useCustomState(false);
    final controller = TextEditingController(text: todo.content);

    void deleteHandler(String id) {
      ref.read(todoListNotifierProvider.notifier).deleteTodo(id: id);
    }

    void updateHandler(String id, String newContent) {
      ref
          .read(todoListNotifierProvider.notifier)
          .updateTodo(id: id, newContent: newContent);
    }

    void convertToUpdate() {
      setIsUpdate(true);
    }

    void submitHandler(text) {
      updateHandler(todo.id, text);
      setIsUpdate(false);
    }

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
        child: isUpdate
            ? TextField(
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
                controller: controller,
                textInputAction: TextInputAction.send,
                onSubmitted: submitHandler,
                autofocus: true,
                decoration: const InputDecoration(border: InputBorder.none),
              )
            : InkWell(
                onTap: () => context.push('/tododetail?id=${todo.id}'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5.0),
                      child: Text(todo.content),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(5.0),
                            constraints: const BoxConstraints(),
                            onPressed: () => convertToUpdate(),
                            iconSize: 20,
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            padding: const EdgeInsets.all(5.0),
                            constraints: const BoxConstraints(),
                            onPressed: () => deleteHandler(todo.id),
                            iconSize: 20,
                            icon: const Icon(Icons.cancel_outlined))
                      ],
                    )
                  ],
                ),
              ));
  }
}
