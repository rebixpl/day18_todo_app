import 'package:day18_todo_app/bloc/todo_cubit.dart';
import 'package:day18_todo_app/views/exception_view.dart';
import 'package:day18_todo_app/views/loading_view.dart';
import 'package:day18_todo_app/views/empty_todos_view.dart';
import 'package:day18_todo_app/widgets/fab_new_todo.dart';
import 'package:day18_todo_app/widgets/nav_bar.dart';
import 'package:day18_todo_app/widgets/todos_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodosNavBar(),
      floatingActionButton: const NewTodoButton(),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is ListTodosSuccess) {
            return state.todos.isEmpty
                ? const EmptyTodosView()
                : TodosListView(todos: state.todos);
          } else if (state is ListTodosFailure) {
            return ExceptionView(exception: state.exception);
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
