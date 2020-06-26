import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/create_screen.dart';
import 'package:todo_app/screens/home_scren.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: buildThemeData(),
      initialRoute: '/',
      routes: routes(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.indigo,
      brightness: Brightness.light,
    );
  }

  void onTaskCreated(String name) {
    // All state modifications have to be wrapped in setState
    // This way Flutter knows that something has changed
    setState(() {
      tasks.add(Task(name));
    });
  }

  void onTaskToggled(Task task) {
    setState(() {
      task.setCompleted(!task.isCompleted());
    });
  }

  Map<String, WidgetBuilder> routes() {
    return {
      '/': (context) => TodoList(tasks: tasks, onToggle: onTaskToggled),
      // Passing our function as a callback
      '/create': (context) => TodoCreate(
            onCreate: onTaskCreated,
          ),
    };
  }
}
