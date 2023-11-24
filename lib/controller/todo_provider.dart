import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoProvider extends ChangeNotifier {
  List items=[];
 TodoProvider(){
  fetchTodo();
 }
  TextEditingController titleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();

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
      items=result;
      notifyListeners();
    } 
  }


  



}
