import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:week8/todo.dart';

part 'todo_database.g.dart';

@DriftDatabase(tables: [Todos])
class TodoDatabase extends _$TodoDatabase {
  TodoDatabase()
    : super(
        driftDatabase(
          name: 'todo_database',
          web: DriftWebOptions(
            sqlite3Wasm: Uri.parse('sqlite3.wasm'),
            driftWorker: Uri.parse('drift_worker.dart.js'),
          ),
        ),
      );

  @override
  int get schemaVersion => 1;
}

@UseRowClass(Todo)
class Todos extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  BoolColumn get done => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
