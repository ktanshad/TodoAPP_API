import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappapi/controller/todo_provider.dart';
import 'package:todoappapi/view/add_page/add_page.dart';
import 'package:todoappapi/view/todo_list/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context)=>TodoProvider(),
      )],
      child: MaterialApp(
        
        routes:{
         '/ADDPage':(context)=>AddPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: TodoListPage()
      ),
    );
  }
}


