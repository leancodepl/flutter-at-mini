import 'package:uuid/uuid.dart';

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.done,
  });

  Todo.create(String title)
      : this(id: const Uuid().v8(), title: title, done: false);

  Todo.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          done: json['done'] as bool,
        );

  final String id;
  final String title;
  final bool done;

  Todo copyWith({
    String? id,
    String? title,
    bool? done,
  }) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        done: done ?? this.done,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'done': done,
      };
}
