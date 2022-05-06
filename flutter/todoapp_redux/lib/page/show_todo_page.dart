// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import '../redux/app_state.dart';
import '../redux/todo/todo_action.dart';
import '../model/todo.dart';

class ShowTodoPage extends StatefulWidget {
  final TodoContent todo;
  const ShowTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _ShowTodoState createState() => _ShowTodoState();
}

class _ShowTodoState extends State<ShowTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("タイトル: ${widget.todo.title}"),
            const Text("内容"),
            Text(widget.todo.content),
            Text("状態: ${widget.todo.getStateString()}"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.todo.setNextState();
                });
                StoreProvider.of<AppState>(context)
                    .dispatch(RefreshSelectTodoAction());
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("状態を更新しました")));
              },
              child: const Text("状態を更新"),
            )
          ],
        ),
      ),
    );
  }
}
