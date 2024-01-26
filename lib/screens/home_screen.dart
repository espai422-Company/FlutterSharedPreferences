import 'package:exercici2/models/todo.dart';
import 'package:exercici2/provider/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context);
    final todos = todosProvider.todos;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              trailing: Checkbox(
                value: false,
                onChanged: (value) {
                  if (value == true) {
                    todosProvider.remove(todo);
                  }
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: const Icon(Icons.add),
        ));
  }
}
