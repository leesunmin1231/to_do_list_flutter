import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_list/src/store/todolist/todo_entity.dart';

part 'todolist_notifier.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo({content}) {
    final previousState = state;
    state = [
      ...previousState,
      Todo(id: (state.length + 1).toString(), content: content)
    ];
  }

  Todo? getTodo({required String id}) {
    for (Todo target in state) {
      if (target.id == id) {
        return target;
      }
    }
    return null;
  }

  bool deleteTodo({id}) {
    for (Todo target in state) {
      if (target.id == id) {
        target.delete();
        return true;
      }
    }
    return false;
  }

  bool updateTodo({id, newContent}) {
    for (Todo target in state) {
      if (target.id == id) {
        target.update(newContent);
        return true;
      }
    }
    return false;
  }
}
