import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_list.dart';
import 'package:flutter_todo_list_side_project2/presentation/view/todo_create_page.dart';
import 'package:flutter_todo_list_side_project2/presentation/viewmodel/todo_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListPage extends StatelessWidget {
  final _todoListProvider = todoListViewModelStateNotifierProvider;

  TodoListPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Todo List side project'),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, _) {
              return ref.watch(_todoListProvider).maybeWhen(
                    success: (content) =>
                        _buildTodoListContainerWidget(ref, content),
                    error: (_) => _buildErrorWidget(),
                    orElse: () => const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildTodoListContainerWidget(WidgetRef ref, final TodoList todoList) {
    return Expanded(child: _buildTodoListWidget(ref, todoList));
  }

  Widget _buildTodoListWidget(final WidgetRef ref, final TodoList todoList) {
    if (todoList.length == 0) {
      return const Center(child: Text('No ToDo'));
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (final BuildContext context, final int index) {
          return _buildTodoItemCardWidget(context, ref, todoList[index]);
        },
      );
    }
  }

  Widget _buildTodoItemCardWidget(
      final BuildContext context, final WidgetRef ref, final TodoModel todo) {
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        ref.read(_todoListProvider.notifier).deleteTodo(todo.id);
      },
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildCheckedIcon(ref, todo),
                const SizedBox(width: 16),
                Text(
                  todo.content,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  convertDescription(todo.importance),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          if (todo.isCompleted) {
            ref.read(_todoListProvider.notifier).undoTodo(todo);
          } else {
            ref.read(_todoListProvider.notifier).completeTodo(todo);
          }
        },
      ),
    );
  }

  String convertDescription(String description) {
    switch (description) {
      case "none":
        return "";
      case "low":
        return "!";
      case "medium":
        return "!!";
      case "high":
        return "!!!";
      default:
        return description;
    }
  }

  Widget _buildCheckedIcon(final WidgetRef ref, final TodoModel todo) {
    return Icon(
      todo.isCompleted
          ? Icons.radio_button_on_rounded
          : Icons.radio_button_off_rounded,
      size: 24,
      color: Colors.purple,
    );
  }

  Widget _buildFloatingActionButton(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showBottomSheetDialog(context),
      child: const Icon(Icons.add),
    );
  }

  void _showBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bc) => TodoCreatePage(),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(child: Text('An error has occurred!'));
  }
}
