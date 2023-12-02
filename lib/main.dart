import 'package:flutter/material.dart';
import 'package:flutter_application_tp5/ListEmployer.dart';
import 'package:flutter_application_tp5/addEmployee.dart';

// Replace with the actual path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListEmployer(),
    );
  }
}
