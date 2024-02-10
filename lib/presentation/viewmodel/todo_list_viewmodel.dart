import 'package:flutter_todo_list_side_project2/domain/domain_module.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_list.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/create_todo_usecase.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/delete_todo_usecase.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/get_todo_list_usecase.dart';
import 'package:flutter_todo_list_side_project2/domain/usecase/update_todo_usecase.dart';
import 'package:flutter_todo_list_side_project2/presentation/state/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoListViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<TodoListViewModel, State<TodoList>>(
  (ref) {
    return TodoListViewModel(
      ref.watch(getTodoListUseCaseProvider),
      ref.watch(createTodoUseCaseProvider),
      ref.watch(updateTodoUseCaseProvider),
      ref.watch(deleteTodoUseCaseProvider),
    );
  },
);

class TodoListViewModel extends StateNotifier<State<TodoList>> {
  final GetTodoListUseCase _getTodoListUseCase;
  final CreateTodoUseCase _createTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoListViewModel(
    this._getTodoListUseCase,
    this._createTodoUseCase,
    this._updateTodoUseCase,
    this._deleteTodoUseCase,
  ) : super(const State.init()) {
    _getTodoList();
  }

  completeTodo(final TodoModel todo) {
    final newTodo = todo.copyWith(isCompleted: true);
    updateTodo(newTodo);
  }

  undoTodo(final TodoModel todo) {
    final newTodo = todo.copyWith(isCompleted: false);
    updateTodo(newTodo);
  }

  _getTodoList() async {
    try {
      state = const State.loading();
      final todoList = await _getTodoListUseCase.execute();
      state = State.success(todoList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addTodo(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  ) async {
    try {
      final newTodo = await _createTodoUseCase.execute(
        id,
        content,
        importance,
        isCompleted,
      );
      state = State.success(state.data!.addTodo(newTodo));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  updateTodo(final TodoModel newTodo) async {
    try {
      await _updateTodoUseCase.execute(
        newTodo.id,
        newTodo.content,
        newTodo.importance,
        newTodo.isCompleted,
      );
      state = State.success(state.data!.updateTodo(newTodo));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteTodo(final int id) async {
    try {
      await _deleteTodoUseCase.execute(id);
      state = State.success(state.data!.removeTodoById(id));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
