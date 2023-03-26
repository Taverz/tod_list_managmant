import 'package:flutter/material.dart';
import 'package:tod_list_managmant/todo_list/todo_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoView(),
      onGenerateRoute: ,
    );
  }
}

//TODO: логирование состояния страницы, после маршрутизации измениться ли состояние ил останится активна страница
//TODO: отлваливание ошибок
//TODO: тонкости проектирования приложения
