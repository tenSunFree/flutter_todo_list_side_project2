import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_list_side_project2/presentation/view/widget/todo_importance_widget.dart';

void main() {
  testWidgets('TodoImportanceWidget updates selection on tap',
      (WidgetTester tester) async {
    Selection? selectedImportance;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoImportanceWidget(
            onSelectionChanged: (Selection selection) {
              selectedImportance = selection;
            },
          ),
        ),
      ),
    );
    expect(selectedImportance, isNull);
    await tester.tap(find.text('Medium'));
    await tester.pump();
    expect(selectedImportance, Selection.medium);
    final mediumSelectionWidget = find.descendant(
      of: find.byWidgetPredicate(
          (widget) => widget is Container && (widget).decoration != null),
      matching: find.text('Medium'),
    );
    expect(mediumSelectionWidget, findsOneWidget);
  });
}
