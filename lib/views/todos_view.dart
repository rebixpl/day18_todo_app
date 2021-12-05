import 'package:day18_todo_app/bloc/todo_cubit.dart';
import 'package:day18_todo_app/models/ModelProvider.dart';
import 'package:day18_todo_app/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosView extends StatefulWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      floatingActionButton: _floatingActionButton(),
      body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
        if (state is ListTodosSuccess) {
          return state.todos.isEmpty
              ? _emptyTodosView()
              : _todosListView(state.todos);
        } else if (state is ListTodosFailure) {
          return _exceptionView(state.exception);
        } else {
          return const LoadingView();
        }
      }),
    );
  }

  Widget _exceptionView(Object exception) {
    return Center(child: Text(exception.toString()));
  }

  AppBar _navBar() {
    return AppBar(
      title: const Text('Todos'),
    );
  }

  Widget _newTodoView() {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: 'Enter todo title'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<TodoCubit>(context)
                .createTodo(_titleController.text);
            _titleController.text = '';
            Navigator.of(context).pop();
          },
          child: const Text('Save Todo'),
        )
      ],
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => _newTodoView(),
        );
      },
    );
  }

  Widget _emptyTodosView() {
    return const Center(
      child: Text('No todos yet'),
    );
  }

  Widget _todosListView(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Card(
          child: CheckboxListTile(
            title: Text(todo.title),
            value: todo.isComplete,
            onChanged: (newValue) {
              BlocProvider.of<TodoCubit>(context)
                  .updateTodoIsComplete(todo, newValue ?? false);
            },
          ),
        );
      },
    );
  }
}
