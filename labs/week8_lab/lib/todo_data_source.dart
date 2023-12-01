import 'package:week8_lab/todo.dart';

abstract class TodoDataSource {
  Future<void> init();
  Future<List<Todo>> getAll();
  Future<Todo?> get(String id);
  Future<void> insert(Todo todo);
  Future<void> delete(String id);
}
