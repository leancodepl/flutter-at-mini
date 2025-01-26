import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class InMemoryTodoDataSource extends TodoDataSource {
  final _todos = <String, Todo>{};

  @override
  void delete(String id) {
    _todos.remove(id);
  }

  @override
  Todo? get(String id) {
    return _todos[id];
  }

  @override
  List<Todo> getAll() {
    return _todos.values.toList();
  }

  @override
  void insert(Todo todo) {
    _todos[todo.id] = todo;
  }

  @override
  void update(Todo todo) {
    _todos[todo.id] = todo;
  }
}
