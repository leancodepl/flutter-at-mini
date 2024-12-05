import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8/todo.dart';
import 'package:week8/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todosCubit = context.watch<TodoCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: switch (todosCubit.state) {
        LoadingTodos() => const Center(child: CircularProgressIndicator()),
        LoadedTodos(todos: []) => const EmptyTodosWidget(),
        LoadedTodos(:final todos) => TodosList(todos: todos),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTodo = await showDialog<String>(
            context: context,
            builder: (_) => const AddTodoDialog(),
          );
          if (newTodo != null) {
            await todosCubit.insert(newTodo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({
    super.key,
  });

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: _title,
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, _title.text),
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class TodosList extends StatelessWidget {
  const TodosList({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: todos.length,
        separatorBuilder: (context, _) => const SizedBox(height: 16),
        itemBuilder: (context, index) => TodoTile(todo: todos[index]),
      ),
    );
  }
}

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (_) => context.read<TodoCubit>().delete(todo.id),
      child: Card.filled(
        margin: EdgeInsets.zero,
        child: ListTile(
          title: Text(todo.title),
          selected: todo.done,
          trailing: Checkbox(
            value: todo.done,
            onChanged: (_) => context.read<TodoCubit>().changeDoneStatus(todo),
          ),
        ),
      ),
    );
  }
}

class EmptyTodosWidget extends StatelessWidget {
  const EmptyTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.task_alt_rounded,
              size: 96,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              "It looks like it's empty in here. Maybe you have something to do?",
              style: theme.textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
