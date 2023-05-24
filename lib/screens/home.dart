import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider & API"),
        centerTitle: true,
      ),
      body: Consumer<TodoProvider>(builder: (context, value, child) {
        if(value.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        final todos = value.todos;
        return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, position) {
              final todo = todos[position];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(todo.id.toString()),
                ),
                title: Text(todo.title, style: TextStyle(color: todo.completed ? Colors.grey : Colors.black),),
              );
            });
      }),
    );
  }
}
