import 'package:exercici2/provider/preferences_provider.dart';
import 'package:exercici2/provider/todos_provider.dart';
import 'package:exercici2/screens/home_screen.dart';
import 'package:exercici2/screens/new_todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesProvider.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodosProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/', // Set the initial route
        routes: {
          '/': (context) => HomeScreen(),
          '/add': (context) => NewTodo(),
        },
      ),
    );
  }
}
