import 'package:flutter/material.dart';
import '../model/todo.dart';
import './todo_list_page.dart';
import './new_todo_page.dart';

class TodoPage extends StatefulWidget {
  final String title;
  const TodoPage({Key? key, required this.title}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<TodoContent> todos = [];
  List<TodoContent> selectedTodos = [];
  int navigation = 0;

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.list,
      ),
      label: 'All',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.push_pin,
      ),
      label: 'To',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.play_arrow,
      ),
      label: 'Doing',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.check,
      ),
      label: 'Done',
    ),
  ];

  @override
  void initState() {
    super.initState();
    selectedTodos = todos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoListPage(
        todos: selectedTodos,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Map<String, String> todo = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return const NewTodoPage();
          }));
          setState(
            () {
              todos.add(TodoContent(
                  title: todo["title"]!, content: todo["content"]!));
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        fixedColor: Colors.greenAccent,
        currentIndex: navigation,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(
            () {
              navigation = index;
              switch (index) {
                case 0:
                  selectedTodos = todos;
                  break;
                case 1:
                  selectedTodos = _toTodoContents();
                  break;
                case 2:
                  selectedTodos = _doingTodoContents();
                  break;
                case 3:
                  selectedTodos = _doneTodoContents();
                  break;
              }
            },
          );
        },
      ),
    );
  }

  List<TodoContent> _toTodoContents() {
    return todos.where((todo) {
      return todo.isTo();
    }).toList();
  }

  List<TodoContent> _doingTodoContents() {
    return todos.where((todo) {
      return todo.isDoing();
    }).toList();
  }

  List<TodoContent> _doneTodoContents() {
    return todos.where((todo) {
      return todo.isDone();
    }).toList();
  }
}
