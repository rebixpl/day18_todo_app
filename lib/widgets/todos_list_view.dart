import 'package:day18_todo_app/models/Todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final Todo todo = todos[index];
        return Card(
          child: CheckboxListTile(
            title: Text(todo.title),
            value: todo.isComplete,
            onChanged: (newVal) {},
          ),
        );
      },
    );
  }
}
