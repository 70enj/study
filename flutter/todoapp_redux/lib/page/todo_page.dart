// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import '../redux/bottom_navigator/navigator_action.dart';
import '../redux/app_state.dart';
import './todo_list_page.dart';
import './new_todo_page.dart';

class TodoPage extends HookWidget {
  final String title;
  TodoPage({Key? key, required this.title}) : super(key: key);

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
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    final navigator = useSelector<AppState, int>(
        (state) => state.bottomNavigatorState.navigation);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const TodoListPage(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NewTodoPage();
          }));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        fixedColor: Colors.greenAccent,
        currentIndex: navigator,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          store.dispatch(SetBottomNavigatorNumAction(navigation: index));
        },
      ),
    );
  }
}
