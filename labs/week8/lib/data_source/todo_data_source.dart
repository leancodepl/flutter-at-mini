import 'dart:async';

import 'package:week8/todo.dart';

abstract class TodoDataSource {
  FutureOr<List<Todo>> getAll();

  FutureOr<Todo?> get(String id);

  FutureOr<void> insert(Todo todo);

  FutureOr<void> delete(String id);
}
