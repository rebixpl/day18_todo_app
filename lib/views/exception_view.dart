import 'package:flutter/cupertino.dart';

class ExceptionView extends StatelessWidget {
  const ExceptionView({
    Key? key,
    required this.exception,
  }) : super(key: key);

  final Object exception;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(exception.toString()),
    );
  }
}
