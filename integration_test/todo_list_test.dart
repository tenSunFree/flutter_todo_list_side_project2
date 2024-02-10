import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_todo_list_side_project2/main.dart' as app;

/// flutter drive --driver=test_driver/integration_test.dart --target=integration_test/todo_list_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Todo List Integration Tests', () {
    testWidgets('Todo List Integration Tests', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      final Finder fab = find.byType(FloatingActionButton);
      await tester.tap(fab);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      final Finder textField = find.byType(TextField);
      await tester.enterText(textField, '12345');
      await tester.pump();
      expect(find.text('12345'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 1));
      final Finder mediumImportanceButton =
          find.widgetWithText(GestureDetector, 'Medium');
      await tester.tap(mediumImportanceButton);
      await tester.pump();
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      final Finder saveButton = find.byIcon(Icons.save);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      final Finder todoItem = find.text('12345');
      await tester.tap(todoItem);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      await tester.timedDrag(
          todoItem, const Offset(-500.0, 0.0), const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
    });
  });
}
