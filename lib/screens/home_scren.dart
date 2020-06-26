import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TodoList extends StatelessWidget {
  final List<Task> tasks;
  final onToggle;
  TodoList({Key key, @required this.tasks, @required this.onToggle})
      : super(key: key);

  @override
  // _TodoListState createState() => _TodoListState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(context),
      body: buildListView(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('TODO'),
      elevation: 0,
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      icon: const Icon(
        Icons.add,
      ),
      label: const Text(
        'Add a Task',
      ),
      elevation: 4.0,
      onPressed: () => Navigator.pushNamed(context, '/create'),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: CheckboxListTile(
              title: Text(tasks[index].getName),
              onChanged: (_) => onToggle(tasks[index]),
              value: tasks[index].isCompleted(),
            ),
            
          );
        });
  }
}
