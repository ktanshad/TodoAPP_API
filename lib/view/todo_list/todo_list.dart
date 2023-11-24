import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappapi/controller/todo_provider.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Consumer<TodoProvider>(
        builder:(context,value,child){
          return    ListView.builder(
          itemCount: value.items.length,
          itemBuilder: (context,index){
            final item=value.items[index] as Map;
            return ListTile(
              leading: Text('${index+1}'),
              title: Text(item['title']),
              subtitle: Text(item['description']),
            );
          });
        } ,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          Navigator.pushNamed(context,'/ADDPage');
        },
        label: Text('ADD TODO'),
        ),
    );
  }
}