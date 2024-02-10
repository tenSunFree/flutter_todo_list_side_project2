import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_list_side_project2/domain/model/todo_model.dart';

/// flutter test test/todo_model_test.dart
void main() {
  group('TodoModel Test', () {
    test('Should toggle todo completed status', () {
      const todo = TodoModel(
        id: 1706748240634,
        content: 'Test Todo',
        isCompleted: false,
        importance: 'low',
      );
      final updatedTodo = todo.copyWith(isCompleted: true);
      expect(updatedTodo.isCompleted, true);
    });
  });
}
