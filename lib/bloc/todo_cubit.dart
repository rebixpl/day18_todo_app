import 'package:day18_todo_app/data/todo_repository.dart';
import 'package:day18_todo_app/models/ModelProvider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TodoState extends Equatable {}

class LoadingTodos extends TodoState {
  @override
  List<Object?> get props => [];
}

class ListTodosSuccess extends TodoState {
  ListTodosSuccess({required this.todos});

  final List<Todo> todos;

  @override
  List<Object?> get props => [todos];
}

class ListTodosFailure extends TodoState {
  ListTodosFailure({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
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

  void updateTodoIsComplete(Todo todo, bool isComplete) async {
    await _todoRepo.updateTodoIsComplete(todo, isComplete);
    getTodos();
  }
}
