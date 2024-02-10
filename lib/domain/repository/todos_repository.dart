import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_list.dart';

abstract class TodosRepository {
  Future<TodoList> getTodoList();

  Future<TodoModel> createTodo(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  );

  Future<void> updateTodo(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  );

  Future<void> deleteTodo(final int id);
}
