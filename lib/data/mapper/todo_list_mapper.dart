import 'package:flutter_todo_list_side_project2/data/entity/todos_entity.dart';
import 'package:flutter_todo_list_side_project2/data/mapper/todo_mapper.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_list.dart';

class TodoListMapper {
  static TodoList transformToModel(final TodoListEntity entities) {
    final values =
        entities.map((entity) => TodoMapper.transformToModel(entity)).toList();
    return TodoList(values: values);
  }
}
