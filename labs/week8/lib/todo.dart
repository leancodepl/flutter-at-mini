import 'package:uuid/uuid.dart';

class Todo {
  Todo({
    required this.noteId,
    required this.title,
    required this.done,
  });

  Todo.create(String title)
      : this(noteId: const Uuid().v8(), title: title, done: false);

  final String noteId;
  final String title;
  final bool done;
}
