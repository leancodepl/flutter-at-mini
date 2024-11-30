import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class InMemoryTodoDataSource extends TodoDataSource {
  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Todo?> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<void> insert(Todo todo) {
    // TODO: implement insert
    throw UnimplementedError();
  }
}
