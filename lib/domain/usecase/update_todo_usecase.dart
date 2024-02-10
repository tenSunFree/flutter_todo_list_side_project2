abstract class UpdateTodoUseCase {
  Future<void> execute(
    final int id,
    final String content,
    final String importance,
    final bool isCompleted,
  );
}
