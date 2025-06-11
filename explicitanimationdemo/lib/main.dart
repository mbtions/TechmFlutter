import 'package:explicitanimationdemo/widgets/custom_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Explicit Animation Demo')),
        body: Center(child: CustomAnimation()),
      ),
    ),
  );
}
