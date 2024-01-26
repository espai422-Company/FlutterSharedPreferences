import 'package:exercici2/models/todo.dart';
import 'package:exercici2/provider/preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  TodosProvider() {
    _todos.addAll(PreferencesProvider.getTodos());
  }
  List<Todo> get todos => _todos;

  void add(Todo todo) {
    PreferencesProvider.addTodo(todo);
    _todos.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) {
    PreferencesProvider.removeTodo(todo);
    _todos.remove(todo);
    notifyListeners();
  }
}
