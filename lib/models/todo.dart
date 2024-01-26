import 'dart:convert';

import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String title;
  String description;
  bool done;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.done,
  });

  factory Todo.fromJson(String str) => Todo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        done: json["done"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "done": done,
      };
  Todo.withGeneratedId({
    required this.title,
    required this.description,
    required this.done,
  }) : id = const Uuid().v4(); // Generate a unique ID using uuid.v4()
}
