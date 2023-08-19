import 'package:flutter/material.dart';
import 'package:tesk_task_getx/data/datasources/remote_datasource.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  RemoteDatsource().getData(2);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

