import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class InMemoryTodoDataSource extends TodoDataSource {
  @override
  void delete(String id) {
    throw UnimplementedError();
  }

  @override
  Todo? get(String id) {
    throw UnimplementedError();
  }

  @override
  List<Todo> getAll() {
    throw UnimplementedError();
  }

  @override
  void insert(Todo todo) {
    throw UnimplementedError();
  }

  @override
  void update(Todo todo) {
    throw UnimplementedError();
  }
}
