import 'package:exercici2/models/todo.dart';
import 'package:exercici2/provider/todos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTodo extends StatelessWidget {
  const NewTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<TodosProvider>(context);
    final title = TextEditingController();
    final description = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Todo'),
        ),
        body: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: description,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                todosProvider.add(Todo.withGeneratedId(
                    title: title.text,
                    description: description.text,
                    done: false));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
