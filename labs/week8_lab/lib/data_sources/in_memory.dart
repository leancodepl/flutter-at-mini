import 'package:week8_lab/todo.dart';
import 'package:week8_lab/todo_data_source.dart';

class InMemoryTodoDataSource extends TodoDataSource {
  final List<Todo> _todos = [];

  @override
  Future<void> init() async {}

  @override
  Future<void> delete(String id) async =>
      _todos.removeWhere((t) => t.noteId == id);

  @override
  Future<Todo?> get(String id) async =>
      _todos.where((t) => t.noteId == id).firstOrNull;

  @override
  Future<List<Todo>> getAll() async => _todos;

  @override
  Future<void> insert(Todo todo) async => _todos.add(todo);
}
