import 'package:flutter/material.dart';

class EmptyTodosView extends StatelessWidget {
  const EmptyTodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No todos yet!"),
    );
  }
}
