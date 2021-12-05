import 'package:day18_todo_app/bloc/todo_cubit.dart';
import 'package:day18_todo_app/widgets/new_todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTodoButton extends StatefulWidget {
  const NewTodoButton({Key? key}) : super(key: key);

  @override
  State<NewTodoButton> createState() => _NewTodoButtonState();
}

class _NewTodoButtonState extends State<NewTodoButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => NewTodoView(),
            );
          },
        );
      },
    );
  }
}
