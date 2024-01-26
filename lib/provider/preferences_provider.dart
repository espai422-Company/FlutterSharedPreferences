import 'package:exercici2/models/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get Todos
  static List<Todo> getTodos() {
    final todos = _preferences.getStringList('todos') ?? [];
    return todos.map((e) => Todo.fromJson(e)).toList();
  }

  // set Todos
  static Future setTodos(List<Todo> todos) async {
    final List<String> todosString =
        todos.map((e) => e.toJson()).toList().cast<String>();
    await _preferences.setStringList('todos', todosString);
  }

  // add Todo
  static Future addTodo(Todo todo) async {
    final todos = getTodos();
    todos.add(todo);
    await setTodos(todos);
  }

  // remove Todo
  static Future removeTodo(Todo todo) async {
    final todos = getTodos().where((todo) => todo.id != todo.id).toList();
    await setTodos(todos);
  }
}
