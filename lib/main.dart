import 'package:flutter/material.dart';
import 'package:to_do_list/src/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
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

class TodoListContainer extends StatefulWidget {
  const TodoListContainer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TodoListContainerState();
  }
}

class _TodoListContainerState extends State<TodoListContainer> {
  final controller = TextEditingController();
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    void submitHandler(e) {
      setState(() {
        todoList.add(e);
        controller.clear();
      });
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
