import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappapi/controller/todo_provider.dart';
import 'package:todoappapi/helpers/helpers.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD TODO'),
      ),
      body:ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: Provider.of<TodoProvider>(context,listen: false).titleController,
            decoration: const InputDecoration(
              hintText: 'title'
            ),
            
          ),
             TextField(
              controller: Provider.of<TodoProvider>(context,listen: false).DescriptionController,
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,           
          ),
          khight20,
          ElevatedButton(onPressed: (){
            Provider.of<TodoProvider>(context,listen: false).SubmitData();
          }, child:const Text('Submit') ,)
        ],
      ),
    );
  }
}