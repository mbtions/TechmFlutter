import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
// import 'package:expressions/expressions.dart' as expressions;
import 'package:math_expressions/math_expressions.dart' as math_expressions;

void main() {
  runApp(const MyCalculatorApp());
}

// Color for simple buttons with numbers
Color numbersBgColor = const Color.fromARGB(255, 167, 200, 250);

// Color for the operator buttons
Color specialBgColor = const Color.fromARGB(255, 247, 244, 244);

// Color for the special buttons (AC, DEL, +/-, =)
Color answerBgColor = const Color.fromARGB(255, 33, 150, 243);

// Color
// Color color4 = const Color.fromARGB(255, 33, 107, 243);

// color
Color color4 = const Color.fromARGB(255, 241, 178, 252);

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

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

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _result = '';
  String _expression = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 50),
          Center(
            child: Text(
              'MY CALCULATOR APP',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 247, 244, 244),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.centerRight,
            child: Text(
              (_result == '') ? '0' : _result,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'AC',
                color: color4,
                onPressed: () {
                  setState(() {
                    _expression = '';
                    _result = '0';
                  });
                },
              ),
              ButtonWidget(
                text: 'DEL',
                color: color4,
                onPressed: () {
                  setState(() {
                    if (_expression.isNotEmpty) {
                      _expression = _expression.substring(
                        0,
                        _expression.length - 1,
                      );
                      _result = _expression.isEmpty ? '0' : _expression;
                    }
                  });
                },
              ),
              ButtonWidget(
                text: '+/-',
                color: color4,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    if (_expression.isNotEmpty) {
                      if (_expression.startsWith('-')) {
                        _expression = _expression.substring(1);
                      } else {
                        _expression = '-' + _expression;
                      }
                      _result = _expression;
                    }
                  });
                },
              ),
              ButtonWidget(
                text: '/',
                color: specialBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '/';
                    _result = _expression;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '7',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '7';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '8',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '8';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '9',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '9';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '*',
                color: specialBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '*';
                    _result = _expression;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '4',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '4';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '5',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '5';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '6',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '6';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '-',
                color: specialBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '-';
                    _result = _expression;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '1',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '1';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '2',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '2';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '3',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '3';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '+',
                color: specialBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '+';
                    _result = _expression;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '%',
                color: specialBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '%';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '0',
                color: numbersBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '0';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '.',
                color: specialBgColor,
                onPressed: () {
                  _expression = (_result == '0') ? '' : _result.toString();
                  setState(() {
                    _expression += '.';
                    _result = _expression;
                  });
                },
              ),
              ButtonWidget(
                text: '=',
                color: answerBgColor,
                onPressed: () {
                  setState(() {
                    try {
                      // Parse the expression using math_expressions package
                      final expression = math_expressions.Parser().parse(
                        _expression.replaceAll('x', '*'),
                      );
                      final contextModel = math_expressions.ContextModel();
                      var result = expression.evaluate(
                        math_expressions.EvaluationType.REAL,
                        contextModel,
                      );
                      _result = result.toString();
                    } catch (e) {
                      _result = 'Error';
                    }
                  });
                },
                textColor: specialBgColor,
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

  const GradientContainer(this.colors, {required this.child, super.key});

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
  final Color textColor;
  final Function onPressed;

  const ButtonWidget({
    required this.text,
    required this.color,
    this.textColor = Colors.black,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 80,
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(8),
          shadowColor: Colors.black,
          elevation: 5,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
