import 'package:flutter/material.dart';

class TodoCreate extends StatefulWidget {
  final onCreate;
  TodoCreate({Key key, this.onCreate}) : super(key: key);

  @override
  _TodoCreateState createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  AppBar buildAppBar() => AppBar(title: Text('Create a task'));

  Center buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextField(
          // Opens the keyboard automatically
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(labelText: 'Enter name for your task'),
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.done),
      onPressed: () {
        // Call the callback with the new task name
        widget.onCreate(controller.text);
        // Go back to list screen
        Navigator.pop(context);
      },
    );
  }
}
