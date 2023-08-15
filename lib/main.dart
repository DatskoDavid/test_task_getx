import 'package:flutter/material.dart';
import 'package:tesk_task_getx/data/remote_datasource.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  RemoteDatsource.getData();
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
      home: const HomeScreen(),
    );
  }
}

