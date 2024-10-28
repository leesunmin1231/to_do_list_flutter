import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todolist_notifier.g.dart';

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
