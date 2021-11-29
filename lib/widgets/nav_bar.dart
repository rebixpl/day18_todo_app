import 'package:flutter/material.dart';

class TodosNavBar extends StatelessWidget with PreferredSizeWidget {
  const TodosNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Todos"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
