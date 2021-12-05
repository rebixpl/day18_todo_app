import 'package:amplify_flutter/amplify.dart';
import 'package:day18_todo_app/models/Todo.dart';

class TodoRepository {
  Future<List<Todo>> getTodos() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createTodo(String title) async {
    final newTodo = Todo(title: title, isComplete: false);

    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTodoIsComplete(Todo todo, bool isComplete) async {
    // to update data modele we need to make sure that id proeprty is the same
    final updatedTodo = todo.copyWith(isComplete: isComplete);

    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      rethrow;
    }
  }
}
