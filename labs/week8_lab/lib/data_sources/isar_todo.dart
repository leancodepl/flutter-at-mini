import 'package:isar/isar.dart';
import 'package:week8_lab/todo.dart';

part 'isar_todo.g.dart';

@collection
class IsarTodo extends Todo {
  IsarTodo({
    required super.noteId,
    required super.title,
    required super.done,
  });

  Id id = Isar.autoIncrement;
}
