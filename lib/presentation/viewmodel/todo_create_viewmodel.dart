import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';
import 'package:flutter_todo_list_side_project2/presentation/viewmodel/todo_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoCreateViewModelProvider =
    Provider.autoDispose.family<TodoCreateViewModel, TodoModel?>(
  (ref, todo) {
    final todoListViewModel =
        ref.watch(todoListViewModelStateNotifierProvider.notifier);
    return TodoCreateViewModel(todo, todoListViewModel);
  },
);

class TodoCreateViewModel {
  final TodoListViewModel _todoListViewModel;
  var _content = '';
  var _importance = '';
  var _isCompleted = false;

  TodoCreateViewModel(final TodoModel? todo, this._todoListViewModel) {
    _initTodo(todo);
  }

  _initTodo(final TodoModel? todo) {
    if (todo != null) {
      _content = todo.content;
      _importance = todo.importance;
      _isCompleted = todo.isCompleted;
    }
  }

  createTodo() {
    _todoListViewModel.addTodo(
        generateUniqueId(), _content, _importance, _isCompleted);
  }

  int generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  setTitle(final String value) => _content = value;

  setImportance(final String value) => _importance = value;

  bool isEnteredContent() => _content.isNotEmpty;
}
