import 'package:flutter_todo_list_side_project2/domain/repository/todos_repository.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/delete_todo_usecase.dart';

class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  final TodosRepository _repository;

  const DeleteTodoUseCaseImpl(this._repository);

  @override
  Future<void> execute(int id) => _repository.deleteTodo(id);
}
