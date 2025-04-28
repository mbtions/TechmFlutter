import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Calculator'), centerTitle: true),
        body: GradientContainer([
          Colors.blue,
          Colors.purple,
        ], child: Calculator()),
      ),
    );
  }
}

// class Calculator extends StatefulWidget {
//   @override
//   _CalculatorState createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator> {
//   void _calculate(String value) {}

class Calculator extends StatelessWidget {
  void _calculate() {
    // Implement your calculation logic here
    // print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 244, 244),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black26,
              //     blurRadius: 10,
              //     offset: Offset(0, 5),
              //   ),
              // ],
            ),
            alignment: Alignment.centerRight,
            child: Text(
              '0',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '7',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '8',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '9',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '/',
                color: Colors.black,
                onPressed: _calculate,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '4',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '5',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '6',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '*',
                color: Colors.black,
                onPressed: _calculate,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '1',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '2',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '3',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '-',
                color: Colors.black,
                onPressed: _calculate,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '0',
                color: Colors.black,
                onPressed: _calculate,
              ),
              ButtonWidget(
                text: '=',
                color: Colors.green,
                onPressed: _calculate,
              ),
              ButtonWidget(text: 'C', color: Colors.red, onPressed: _calculate),
              ButtonWidget(
                text: '+',
                color: Colors.black,
                onPressed: _calculate,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  final Widget child;

  GradientContainer(this.colors, {required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  ButtonWidget({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 80,
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(8),
          shadowColor: Colors.black,
          elevation: 5,
        ),
        child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}
