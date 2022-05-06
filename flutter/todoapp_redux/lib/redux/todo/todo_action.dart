import '../../model/todo.dart';

class AddTodoAction {
  final String title;
  final String content;

  AddTodoAction({required this.title, required this.content});
}

class SetSelectTodosAction {
  final List<TodoContent> selectTodos;
  SetSelectTodosAction({required this.selectTodos});
}

class RefreshSelectTodoAction {}
