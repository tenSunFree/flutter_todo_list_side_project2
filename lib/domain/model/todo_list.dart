import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list.freezed.dart';

@freezed
class TodoList with _$TodoList {
  const factory TodoList({required List<TodoModel> values}) = _TodoList;

  const TodoList._();

  operator [](final int index) => values[index];

  int get length => values.length;

  TodoList addTodo(final TodoModel todo) => copyWith(values: [...values, todo]);

  TodoList updateTodo(final TodoModel newTodo) {
    return copyWith(values: values.map((todo) => newTodo.id == todo.id ? newTodo : todo).toList());
  }

  TodoList removeTodoById(final int id) => copyWith(values: values.where((todo) => todo.id != id).toList());

  TodoList filterByCompleted() => copyWith(values: values.where((todo) => todo.isCompleted).toList());

  TodoList filterByIncomplete() => copyWith(values: values.where((todo) => !todo.isCompleted).toList());
}
