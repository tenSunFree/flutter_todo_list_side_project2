typedef TodoListEntity = List<TodoEntity>;

class TodoEntity {
  int id;
  String content;
  String importance;
  bool isCompleted;

  TodoEntity({
    required this.id,
    required this.content,
    required this.importance,
    required this.isCompleted,
  });
}
