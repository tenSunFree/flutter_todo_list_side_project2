import 'package:flutter_todo_list_side_project2/domain/repository/todos_repository.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/update_todo_usecase.dart';

class UpdateTodoUseCaseImpl implements UpdateTodoUseCase {
  final TodosRepository _repository;

  const UpdateTodoUseCaseImpl(this._repository);

  @override
  Future<void> execute(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  ) {
    return _repository.updateTodo(
      id,
      content,
      importance,
      isCompleted
    );
  }
}
