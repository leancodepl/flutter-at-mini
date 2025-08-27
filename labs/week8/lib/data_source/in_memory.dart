import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class InMemoryTodoDataSource extends TodoDataSource {
  final _todos = <String, Todo>{};

  @override
  Future<void> delete(String id) async {
    _todos.remove(id);
  }

  @override
  Future<Todo?> get(String id) async {
    return _todos[id];
  }

  @override
  Future<List<Todo>> getAll() async {
    return _todos.values.toList();
  }

  @override
  Future<void> insert(Todo todo) async {
    _todos[todo.id] = todo;
  }

  @override
  Future<void> update(Todo todo) async {
    _todos[todo.id] = todo;
  }
}
