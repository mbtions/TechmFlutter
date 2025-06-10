import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagementdemoapp/list_provider.dart';
import 'package:statemanagementdemoapp/screens/first_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumberListProvider()),
      ],
      child: MaterialApp(home: FirstScreen()),
    ),
  );
}
