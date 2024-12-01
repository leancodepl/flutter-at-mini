import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:week8/data_source/todo_data_source.dart';
import 'package:week8/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required this.dataSource}) : super(const LoadingTodos());

  final TodoDataSource dataSource;

  Future<void> refresh() async {
    emit(
      LoadingTodos(
        todos: switch (state) {
          LoadedTodos(:final todos) => todos,
          _ => null,
        },
      ),
    );

    final newTodos = await dataSource.getAll();

    emit(LoadedTodos(todos: newTodos));
  }

  Future<void> insert(String title) async {
    await dataSource.insert(Todo.create(title));
    await refresh();
  }

  Future<void> delete(String id) async {
    await dataSource.delete(id);
    await refresh();
  }

  Future<void> changeDoneStatus(Todo todo) async {
    await dataSource.update(todo.copyWith(done: !todo.done));
    await refresh();
  }
}

sealed class TodoState with EquatableMixin {
  const TodoState();
}

class LoadingTodos extends TodoState {
  const LoadingTodos({this.todos});

  final List<Todo>? todos;

  @override
  List<Object?> get props => [todos];
}

class LoadedTodos extends TodoState {
  const LoadedTodos({required this.todos});

  final List<Todo> todos;

  @override
  List<Object?> get props => [todos];
}
