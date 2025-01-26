import 'package:localstore/localstore.dart';
import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class LocalstoreTodoDataSource extends TodoDataSource {
  LocalstoreTodoDataSource({required this.localstore});

  final Localstore localstore;

  CollectionRef get _collection => localstore.collection('todos');

  @override
  Future<void> delete(String id) async {
    await _collection.doc(id).delete();
  }

  @override
  Future<Todo?> get(String id) async {
    final doc = await _collection.doc(id).get();
    if (doc == null) {
      return null;
    }
    return Todo.fromJson(doc);
  }

  @override
  Future<List<Todo>> getAll() async {
    final docs = await _collection.get();
    return [
      if (docs != null)
        for (final doc in docs.values)
          if (doc is Map<String, dynamic>) Todo.fromJson(doc),
    ];
  }

  @override
  Future<void> insert(Todo todo) async {
    await _collection.doc(todo.id).set(todo.toJson());
  }

  @override
  Future<void> update(Todo todo) async {
    await _collection.doc(todo.id).set(todo.toJson());
  }
}
