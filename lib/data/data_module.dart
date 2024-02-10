import 'package:flutter_todo_list_side_project2/data/repository/todos_repository_impl.dart';
import 'package:flutter_todo_list_side_project2/domain/repository/todos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'datasource/cache/todo_cache.dart';
import 'datasource/cache/todo_cache_impl.dart';

final todoCacheProvider = Provider<TodoCache>((_) => TodoCacheImpl.instance);

final todosRepositoryProvider = Provider<TodosRepository>(
    (ref) => TodosRepositoryImpl(ref.watch(todoCacheProvider)));
