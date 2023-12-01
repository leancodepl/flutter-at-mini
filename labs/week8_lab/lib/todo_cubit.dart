import 'package:bloc/bloc.dart';
import 'package:week8_lab/todo.dart';
import 'package:week8_lab/todo_data_source.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit({required TodoDataSource dataSource})
      : _dataSource = dataSource,
        super(LoadingTodos());

  final TodoDataSource _dataSource;

  Future<void> init() async {
    await _dataSource.init();
    await refresh();
  }

  Future<void> refresh() async {
    emit(switch (state) {
      TodosData(:final todos) => LoadingTodos(todos: todos),
      _ => LoadingTodos(),
    });

    final newTodos = await _dataSource.getAll();

    emit(newTodos.isEmpty ? EmptyTodos() : TodosData(todos: newTodos));
  }

  Future<void> insert(String title) async {
    await _dataSource.insert(Todo.create(title: title));
    await refresh();
  }

  Future<void> delete(String id) async {
    await _dataSource.delete(id);
    await refresh();
  }
}

sealed class TodoState {}

class EmptyTodos extends TodoState {}

class LoadingTodos extends TodoState {
  LoadingTodos({this.todos});

  final List<Todo>? todos;
}

class TodosData extends TodoState {
  TodosData({required this.todos});

  final List<Todo> todos;
}
