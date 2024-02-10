import 'package:flutter_todo_list_side_project2/data/entity/todos_entity.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';

class TodoMapper {
  static TodoModel transformToModel(final TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      content: entity.content,
      importance: entity.importance,
      isCompleted: entity.isCompleted,
    );
  }

  static TodoEntity transformToEntity(final TodoModel model) {
    return TodoEntity(
      id: model.id,
      content: model.content,
      importance: model.importance,
      isCompleted: model.isCompleted,
    );
  }
}
