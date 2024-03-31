import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Login/LoginPage.dart';
import 'AppScreensMain/TODO_1.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TODO_1(),
    );
  }
}
