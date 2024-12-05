import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class HiveTodoDataSource extends TodoDataSource {
  HiveTodoDataSource();

  @override
  Future<void> delete(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<Todo?> get(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<void> insert(Todo todo) async {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Todo todo) async {
    throw UnimplementedError();
  }
}
