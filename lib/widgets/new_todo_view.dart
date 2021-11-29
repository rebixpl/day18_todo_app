import 'package:day18_todo_app/bloc/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTodoViewState extends StatefulWidget {
  const NewTodoViewState({Key? key}) : super(key: key);

  @override
  _NewTodoViewStateState createState() => _NewTodoViewStateState();
}

class _NewTodoViewStateState extends State<NewTodoViewState> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubit(),
      child: NewTodoView(),
    );
  }
}

class NewTodoView extends StatelessWidget {
  NewTodoView({Key? key}) : super(key: key);

  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: "Enter todo title"),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<TodoCubit>(context)
                .createTodo(_titleController.text);
            _titleController.text = "";
            Navigator.of(context).pop();
          },
          child: const Text("Save todo"),
        ),
      ],
    );
  }
}
