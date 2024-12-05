# Lab 8 – data persistence & testing

> ⚠️ ***Formatting & analysis***
>
> To get full marks for the task, your code must be properly formatted and
> must not produce any analysis issues. That is, running the following
> commands in the week's directory must not report any issues or changes:
>
> ```shell
> dart format --output=none --set-exit-if-changed .
> flutter analyze
> ```

Check out the [hosted example solution](https://flutter-at-mini-2024-lab-8.web.app/)
to play around with the implemented features.

## Data persistence

Implement the `TodoDataSource` using four different persistence methods.

Data source features to implement:

- List all Todos
- Get a Todo by ID
- Insert a new Todo
- Remove Todo by ID
- Update a Todo with new data

### In-memory

Implement the `InMemoryTodoDataSource`. Store the data in a collection inside the object.

This kind of persistence isn't very persistent, but it's still useful sometimes.

### Drift – relational

- Implement the `DriftTodoDataSource` using a Drift SQL database.
- Follow the steps in [the official documentation](https://drift.simonbinder.eu/setup/).
- Use the existing `Todo` class as the model (drift would generate its own otherwise).
  Use the `@UseRowClass` annotation for this.

Packages:

- [`drift`](https://pub.dev/packages/drift)
- [`drift_flutter`](https://pub.dev/packages/drift_flutter)
- [`drift_dev`](https://pub.dev/packages/drift_dev)

### Hive – NoSQL

- Implement the `HiveTodoDataSource` using a Hive box.
- To store custom objects in Hive, you need to use a TypeAdapter.
  You can generate one using the `hive_generator` package, or write one manually
  (I recommend this option for not-so-complicated types).

Packages:

- [`hive`](https://pub.dev/packages/hive)
- [`hive_flutter`](https://pub.dev/packages/hive_flutter)
- Optionally [`hive_generator`](https://pub.dev/packages/hive_generator) for code generation

> ⚠️ ***Why not Isar?***
>
> [Isar](https://pub.dev/packages/isar) is the successor of Hive, and thus is recommended instead of it.
> However, the current 3.x versions don't support running on the Web (Hive does).

### Localstore – NoSQL, very Firestore-like

- Implement the `LocalstoreTodoDataSource` using the Localstore database.
- Localstore is JSON-based, so it can only store serialized data (like Firestore).

Packages:
- [`localstore`](https://pub.dev/packages/localstore)

## Testing

### Cubit tests

- Write tests for the TodoCubit.
- Test each method – ensure it emits correct states.
- Also verify that appropriate methods of the data source are called.

### Widget tests

- Verify that a `TodoTile` is properly displayed
  - Verify that the Todo's title is visible
  - Verify that a done Todo displays a checked checkbox, and that an undone Todo displays an empty checkbox
- Verify that the `HomePage` contains all four possible cards
  (i.e., a `Card` with an appropriate text inside for each option)
