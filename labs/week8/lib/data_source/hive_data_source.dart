import 'package:hive/hive.dart';
import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class HiveTodoDataSource extends TodoDataSource {
  HiveTodoDataSource({required this.boxFuture});

  final Future<Box<Todo>> boxFuture;

  @override
  Future<void> delete(String id) async {
    final box = await boxFuture;
    await box.delete(id);
  }

  @override
  Future<Todo?> get(String id) async {
    final box = await boxFuture;
    return box.get(id);
  }

  @override
  Future<List<Todo>> getAll() async {
    final box = await boxFuture;
    return box.values.toList();
  }

  @override
  Future<void> insert(Todo todo) async {
    final box = await boxFuture;
    await box.put(todo.id, todo);
  }

  @override
  Future<void> update(Todo todo) async {
    final box = await boxFuture;
    await box.put(todo.id, todo);
  }
}

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  int get typeId => 0;

  @override
  Todo read(BinaryReader reader) {
    return Todo(
      id: reader.readString(),
      title: reader.readString(),
      done: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.title)
      ..writeBool(obj.done);
  }
}
