import 'package:flutter/material.dart';
import 'package:mymealapp/Screens/home_screen.dart';

void main() {
  runApp(const MyMealApp());
}

class MyMealApp extends StatelessWidget {
  const MyMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
