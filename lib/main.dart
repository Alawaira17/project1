// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:project1/add.dart';
import 'UserListView.dart';

// Import your home page class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddEmployeeView(), // Set your home page here
    );
  }
}