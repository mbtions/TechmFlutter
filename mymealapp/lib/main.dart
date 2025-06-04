import 'package:flutter/material.dart';
import 'package:mymealapp/Screens/home_screen.dart';

void main() {
  runApp(MyMealApp());
}

class MyMealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
