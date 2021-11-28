import 'package:day18_todo_app/widgets/empty_todos_view.dart';
import 'package:day18_todo_app/widgets/fab_new_todo.dart';
import 'package:day18_todo_app/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class TodosView extends StatefulWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  _TodosViewState createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodosNavBar(),
      floatingActionButton: const NewTodoButton(),
      body: const EmptyTodosView(),
    );
  }
}
