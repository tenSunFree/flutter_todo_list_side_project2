import 'package:flutter/cupertino.dart';
import '../../entity/todos_entity.dart';
import 'todo_cache.dart';

class TodoCacheImpl implements TodoCache {
  static final TodoCacheImpl _instance = TodoCacheImpl._internal();
  final List<TodoEntity> _todos = [];

  TodoCacheImpl._internal();

  static TodoCacheImpl get instance => _instance;

  @override
  Future<TodoListEntity> allTodos() async {
    return _todos;
  }

  @override
  Future<TodoEntity> insertTodo(final TodoEntity todo) async {
    _todos.add(todo);
    return todo;
  }

  @override
  Future<void> updateTodo(final TodoEntity todo) async {
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    } else {
      debugPrint('Todo with id ${todo.id} not found for update.');
    }
  }

  @override
  Future<void> deleteTodo(final int id) async {
    _todos.removeWhere((t) => t.id == id);
  }
}
