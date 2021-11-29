import 'package:day18_todo_app/bloc/todo_cubit.dart';
import 'package:day18_todo_app/widgets/new_todo_view.dart';
import 'package:flutter/material.dart';

class NewTodoButton extends StatelessWidget {
  const NewTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const NewTodoViewState(),
        );
      },
    );
  }
}
