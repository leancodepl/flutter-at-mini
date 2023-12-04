import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:week8_lab/data_sources/isar_todo.dart';
import 'package:week8_lab/todo.dart';
import 'package:week8_lab/todo_data_source.dart';

class IsarTodoDataSource extends TodoDataSource {
  static late Isar _isar;
  static bool _initialized = false;

  @override
  Future<void> init() async {
    if (!_initialized) {
      _initialized = true;
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open(
        [IsarTodoSchema],
        directory: dir.path,
      );
    }
  }

  @override
  Future<void> delete(String id) async => _isar.writeTxn(
        () async => _isar.isarTodos.filter().noteIdEqualTo(id).deleteAll(),
      );

  @override
  Future<Todo?> get(String id) =>
      _isar.isarTodos.filter().noteIdEqualTo(id).findFirst();

  @override
  Future<List<Todo>> getAll() => _isar.isarTodos.where().findAll();

  @override
  Future<void> insert(Todo todo) => _isar.writeTxn(
        () async => await _isar.isarTodos.put(
          IsarTodo(
            noteId: todo.noteId,
            title: todo.title,
            done: todo.done,
          ),
        ),
      );
}
