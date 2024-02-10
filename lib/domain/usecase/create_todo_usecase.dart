import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';

abstract class CreateTodoUseCase {
  Future<TodoModel> execute(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  );
}
