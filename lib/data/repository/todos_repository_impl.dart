import 'package:flutter_todo_list_side_project2/data/mapper/todo_list_mapper.dart';
import 'package:flutter_todo_list_side_project2/data/mapper/todo_mapper.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_list.dart';
import 'package:flutter_todo_list_side_project2/domain/repository/todos_repository.dart';
import '../datasource/cache/todo_cache.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodoCache cache;

  const TodosRepositoryImpl(this.cache);

  @override
  Future<TodoList> getTodoList() async {
    final todoListEntity = await cache.allTodos();
    return TodoListMapper.transformToModel(todoListEntity);
  }

  @override
  Future<TodoModel> createTodo(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  ) async {
    final todoEntity = await cache.insertTodo(
      TodoMapper.transformToEntity(
        TodoModel(
          id: id,
          content: content,
          importance: importance,
          isCompleted: isCompleted,
        ),
      ),
    );
    return TodoMapper.transformToModel(todoEntity);
  }

  @override
  Future<void> updateTodo(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  ) async {
    final todo = TodoModel(
      id: id,
      content: content,
      importance: importance,
      isCompleted: isCompleted,
    );
    await cache.updateTodo(TodoMapper.transformToEntity(todo));
  }

  @override
  Future<void> deleteTodo(final int id) async => await cache.deleteTodo(id);
}
