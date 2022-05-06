import 'package:flutter/material.dart';
import '../../model/todo.dart';

@immutable
class TodoState {
  final List<TodoContent> todos;
  final List<TodoContent> selectTodos;

  const TodoState({required this.todos, required this.selectTodos});

  factory TodoState.initial() => const TodoState(todos: [], selectTodos: []);

  TodoState copyWith(
      {List<TodoContent>? todos, List<TodoContent>? selectTodos}) {
    return TodoState(
        todos: todos ?? this.todos,
        selectTodos: selectTodos ?? this.selectTodos);
  }
}
