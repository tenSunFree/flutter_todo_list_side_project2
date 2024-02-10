import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';
import 'package:flutter_todo_list_side_project2/domain/repository/todos_repository.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/create_todo_usecase.dart';

class CreateTodoUseCaseImpl implements CreateTodoUseCase {
  final TodosRepository _repository;

  const CreateTodoUseCaseImpl(this._repository);

  @override
  Future<TodoModel> execute(
    int id,
    String content,
    String importance,
    bool isCompleted,
  ) {
    return _repository.createTodo(id, content, importance, isCompleted);
  }
}
