import 'package:flutter/material.dart';
import './show_todo_page.dart';
import '../model/todo.dart';

class TodoListPage extends StatelessWidget {
  final List<TodoContent> todos;
  const TodoListPage({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
