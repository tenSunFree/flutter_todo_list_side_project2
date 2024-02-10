import 'package:flutter_todo_list_side_project2/domain/model/todo_list.dart';

abstract class GetTodoListUseCase {
  Future<TodoList> execute();
}
