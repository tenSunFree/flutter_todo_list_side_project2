import 'package:flutter_todo_list_side_project2/data/data_module.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/create_todo_usecase.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/create_todo_usecase_impl.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/delete_todo_usecase.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/delete_todo_usecase_impl.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/get_todo_list_usecase.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/get_todo_list_usecase_impl.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/update_todo_usecase.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/update_todo_usecase_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTodoListUseCaseProvider =
    Provider<GetTodoListUseCase>((ref) => GetTodoListUseCaseImpl(ref.watch(todosRepositoryProvider)));
final createTodoUseCaseProvider =
    Provider<CreateTodoUseCase>((ref) => CreateTodoUseCaseImpl(ref.watch(todosRepositoryProvider)));
final updateTodoUseCaseProvider =
    Provider<UpdateTodoUseCase>((ref) => UpdateTodoUseCaseImpl(ref.watch(todosRepositoryProvider)));
final deleteTodoUseCaseProvider =
    Provider<DeleteTodoUseCase>((ref) => DeleteTodoUseCaseImpl(ref.watch(todosRepositoryProvider)));
