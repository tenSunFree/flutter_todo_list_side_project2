import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required int id,
    required String content,
    required String importance,
    required bool isCompleted,
  }) = _TodoModel;

  const TodoModel._();

  TodoModel complete() => copyWith(isCompleted: true);

  TodoModel incomplete() => copyWith(isCompleted: false);
}
