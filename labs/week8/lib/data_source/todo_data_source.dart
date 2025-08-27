import 'dart:async';

import 'package:week8/todo.dart';

abstract class TodoDataSource {
  Future<List<Todo>> getAll();

  Future<Todo?> get(String id);

  Future<void> insert(Todo todo);

  Future<void> delete(String id);

  Future<void> update(Todo todo);
}
