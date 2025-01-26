import 'package:drift/drift.dart';
import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/db/todo_database.dart';
import 'package:week8/todo.dart';

class DriftTodoDataSource extends TodoDataSource {
  DriftTodoDataSource({required this.db});

  final TodoDatabase db;

  @override
  Future<void> delete(String id) {
    return db.managers.todos.filter((f) => f.id.equals(id)).delete();
  }

  @override
  Future<Todo?> get(String id) {
    return db.managers.todos.filter((f) => f.id.equals(id)).getSingleOrNull();
  }

  @override
  Future<List<Todo>> getAll() {
    return db.managers.todos.get();
  }

  @override
  Future<void> insert(Todo todo) {
    return db.managers.todos.create(
      (c) => c(
        id: todo.id,
        title: todo.title,
        done: todo.done,
      ),
    );
  }

  @override
  Future<void> update(Todo todo) {
    return db.managers.todos
        .filter((f) => f.id.equals(todo.id))
        .update((c) => c(done: Value(todo.done)));
  }
}
