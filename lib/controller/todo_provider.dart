import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoappapi/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  
 TodoProvider(){
  fetchTodo();
 }
  TextEditingController titleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  List<TodoModel> items=[];
  bool isEdit =false;
  

  Future<void> SubmitData() async {
    //get the data from form
    final title = titleController.text;
    final description = DescriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //submit data for the server
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    //show success or not messege based on status
    if (response.statusCode == 201) {
      titleController.text = '';
      DescriptionController.text = '';
      print('creation success');
    } else {
      print('creation failed');
    }

    fetchTodo();
  }

  Future<void> fetchTodo()async{
    const url='https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri=Uri.parse(url);
    final response= await http.get(uri);
    if(response.statusCode==200){
      final json=jsonDecode(response.body) as Map;
      final result =json['items'] as List;
      items=result.map((json) => TodoModel.fromJson(json)).toList();
      notifyListeners();
    } 
  }

  Future<void> deleteById(String id)async{
  final url='https://api.nstack.in/v1/todos/$id';
   final uri=Uri.parse(url);
   final response=await http.delete(uri);
   if(response.statusCode==200){
      //remove item for the list 
    final filtered=items.where((todo) => todo.id!=id).toList();
    items=filtered;
    notifyListeners();
   }else{
   //error
   print('error');
   }
  }


  Future<void> updateData(TodoModel todoModel)async{
    if(todoModel==null){
      print('you can not call updated without todo data');
      return;
    }
    final id=todoModel.id;
    final title=titleController.text;
    final description=DescriptionController.text;
    final Map<String,dynamic> body={
      "title":title,
      "description":description,
      "is_completed":false,
    }; 

       //update data for the server
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.put(uri,
        body: jsonEncode(body),
         headers: {'Content-Type': 'application/json'});
    //show success or not messege based on status
    if (response.statusCode == 200) {
       titleController.text = '';
      DescriptionController.text = '';
      print('Updation success');
    } else {
      print('Updation failed');
    }
    fetchTodo();
  }

  void isEditValueChange(bool value){
    isEdit=value;
    notifyListeners();
  }


  



}
