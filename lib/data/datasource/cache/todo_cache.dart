import 'package:flutter_todo_list_side_project2/data/entity/todos_entity.dart';

abstract class TodoCache {
  Future<TodoListEntity> allTodos();

  Future<TodoEntity> insertTodo(final TodoEntity todoEntity);

  Future<void> updateTodo(final TodoEntity todoEntity);

  Future<void> deleteTodo(final int id);
}
