import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tesk_task_getx/domain/di/injector.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  Injector().initInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

