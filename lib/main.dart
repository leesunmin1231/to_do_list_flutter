import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_list/src/core/theme/app_theme.dart';

part 'main.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  List<String> build() {
    return [];
  }

  void addTodo(String todo) {
    final previousState = state;
    state = [...previousState, todo];
  }
}

void main() {
  runApp(
    // Provider가 동작할 수 있도록 앱의 가장 최상위 부모 위젯을 ProviderScope로 감싸줍니다.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.appTheme,
        home: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  "To do list",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            body: const Center(child: TodoListContainer())));
  }
}

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
            ...todoList.map((ele) => Container(
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
