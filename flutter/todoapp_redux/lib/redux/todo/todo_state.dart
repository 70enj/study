// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../model/todo.dart';

@immutable
class TodoState {
  final List<TodoContent> todos;
  final List<TodoContent> selectTodos;

  const TodoState({required this.todos, required this.selectTodos});

  //factory TodoState.initial() => TodoState(todos: [], selectTodos: []);
  factory TodoState.initial() => TodoState(todos: [
        TodoContent(title: "A", content: "1", state: TodoStatus.to),
        TodoContent(title: "B", content: "2", state: TodoStatus.to),
        TodoContent(title: "C", content: "3", state: TodoStatus.doing),
        TodoContent(title: "D", content: "4", state: TodoStatus.doing),
        TodoContent(title: "E", content: "5", state: TodoStatus.done),
        TodoContent(title: "F", content: "6", state: TodoStatus.done),
      ], selectTodos: []);

  TodoState copyWith(
      {List<TodoContent>? todos, List<TodoContent>? selectTodos}) {
    return TodoState(
        todos: todos ?? this.todos,
        selectTodos: selectTodos ?? this.selectTodos);
  }
}
