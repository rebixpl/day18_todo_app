import 'package:flutter/material.dart';

class NewTodoButton extends StatelessWidget {
  const NewTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        debugPrint("show new todo sheet");
      },
    );
  }
}
