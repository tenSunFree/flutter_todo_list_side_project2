import 'package:flutter_todo_list_side_project2/domain/model/todo_list.dart';
import 'package:flutter_todo_list_side_project2/domain/repository/todos_repository.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/get_todo_list_usecase.dart';

class GetTodoListUseCaseImpl implements GetTodoListUseCase {
  final TodosRepository _repository;

  const GetTodoListUseCaseImpl(this._repository);

  @override
  Future<TodoList> execute() => _repository.getTodoList();
}
