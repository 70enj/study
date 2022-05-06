// ignore: import_of_legacy_library_into_null_safe
import 'package:redux/redux.dart';
import './app_reducer.dart';
import './app_state.dart';
import './todo/todo_middleware.dart';

Future<Store<AppState>> createStore() async {
  return Store(appReducer,
      initialState: AppState.initial(), middleware: [TodoMiddleware()]);
}
