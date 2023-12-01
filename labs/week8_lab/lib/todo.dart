import 'package:uuid/uuid.dart';

class Todo {
  Todo({
    required this.noteId,
    required this.title,
    required this.done,
  });

  factory Todo.create({
    required String title,
  }) =>
      Todo(noteId: const Uuid().v8(), done: false, title: title);

  final String noteId;
  final String title;
  final bool done;
}
