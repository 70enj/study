// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import '../redux/app_state.dart';
import './show_todo_page.dart';
import '../model/todo.dart';

class TodoListPage extends HookWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todos = useSelector<AppState, List<TodoContent>>(
        (state) => state.todoState.selectTodos);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowTodoPage(
                                  todo: todos[index],
                                )));
                  },
                  child: ListTile(
                    title: Text(
                        "${todos[index].title}(${todos[index].getStateString()})"),
                    subtitle: Text(todos[index].content),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
