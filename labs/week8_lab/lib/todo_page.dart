import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week8_lab/todo.dart';
import 'package:week8_lab/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) => switch (state) {
          EmptyTodos() => const EmptyTodosWidget(),
          LoadingTodos() => const Center(child: CircularProgressIndicator()),
          TodosData(:final todos) => TodosList(todos: todos),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final cubit = context.read<TodoCubit>();

          if (await showDialog<String>(
            context: context,
            builder: (_) => const AddTodoDialog(),
          )
              case final title?) {
            cubit.insert(title);
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
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, i) {
        final todo = todos[i];

        return Dismissible(
          key: ValueKey(todo.noteId),
          onDismissed: (_) => context.read<TodoCubit>().delete(todo.noteId),
          child: ListTile(
            title: Text(todo.title),
            selected: todo.done,
            trailing: Checkbox(
              value: todo.done,
              onChanged: (_) {},
            ),
          ),
        );
      },
    );
  }
}

class EmptyTodosWidget extends StatelessWidget {
  const EmptyTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_dissatisfied),
          Text(
              'It looks like it\'s empty in here. Maybe you have something to do?')
        ],
      ),
    );
  }
}
