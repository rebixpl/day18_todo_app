import 'package:day18_todo_app/data/todo_repository.dart';
import 'package:day18_todo_app/models/ModelProvider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TodoState {}

class LoadingTodos extends TodoState {}

class ListTodosSuccess extends TodoState {
  ListTodosSuccess({required this.todos});

  final List<Todo> todos;
}

class ListTodosFailure extends TodoState {
  ListTodosFailure({required this.exception});

  final Object exception;
}

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(LoadingTodos());

  final TodoRepository _todoRepo = TodoRepository();

  void getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }

    try {
      final todos = await _todoRepo.getTodos();
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      emit(ListTodosFailure(exception: e));
    }
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title);
    getTodos();
  }

  void updateTodoIsComplete(Todo todo, bool isComplete) {}
}
