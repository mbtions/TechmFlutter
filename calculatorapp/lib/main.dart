import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart' as math_expressions;
import '../components/widgets/ButtonWidget.dart';
import '../components/widgets/GradientContainer.dart';
import '../constants.dart';

void main() {
  runApp(const MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(title: Text('Calculator'), centerTitle: true),
        body: GradientContainer([
          gradientColor1,
          gradientColor2,
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
  static const int MAX_LENGTH = 12;

  // format output when length increases the max_length
  String formatOutput(String result) {
    if (result.length <= MAX_LENGTH) {
      return result;
    }

    // Try to convert to a number (double)
    double? number = double.tryParse(result);
    if (number == null) {
      // Fallback: can't parse to number, return original
      return result;
    }

    // Convert to exponential notation with 5 digits
    return number.toStringAsExponential(5);
  }

  // function to identify when the button is pressed, and print its label
  void _onButtonPressed(String label) {
    String result = '';
    if (label == 'AC') {
      _expression = '';
      result = '0';
    } else if (label == 'DEL') {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
        result = _expression.isEmpty ? '0' : _expression;
      }
    } else if (label == '+/-') {
      if (_expression.isNotEmpty && _result != '0') {
        if (_expression.startsWith('-')) {
          _expression = _expression.substring(1);
        } else {
          _expression = '-$_expression';
        }
        result = _expression.isEmpty ? '0' : _expression;
      } else {
        result = '0';
      }
    } else if (label == '%') {
      _expression = (_result == '0') ? '' : _result.toString();
      if (_expression.isNotEmpty) {
        _expression += '%';
        result = _expression;
      }
      // });
    } else if (label == '.') {
      if (_expression.isNotEmpty) {
        if (!_expression.contains('.')) {
          _expression += '.';
          result = _expression;
        }
      } else {
        _expression += '0.';
        result = _expression;
      }
    } else if (label == '=') {
      try {
        // Parse the expression using math_expressions package
        final expression = math_expressions.Parser().parse(
          _expression,
        ); // _expression.replaceAll('x', '*'),

        final contextModel = math_expressions.ContextModel();
        var answer = expression.evaluate(
          math_expressions.EvaluationType.REAL,
          contextModel,
        );
        _expression = answer.toString();
        result = formatOutput(answer.toString());
      } catch (e) {
        result = 'Error';
      }
    } else {
      _expression += label;
      result = _expression.isEmpty ? '0' : _expression;
    }

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          // SizedBox(height: 50),
          // Center(
          //   child: Text(
          //     'MY CALCULATOR APP',
          //     style: TextStyle(
          //       fontSize: 30,
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8),
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
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'AC',
                color: specialBgColor,
                onPressed: () {
                  setState(() {
                    _expression = '';
                    _result = '0';
                  });
                },
                textColor: specialColor,
              ),
              ButtonWidget(
                text: 'DEL',
                color: specialBgColor,
                onPressed: () => {_onButtonPressed('DEL')},
                // () {
                //   setState(() {
                //     if (_expression.isNotEmpty) {
                //       _expression = _expression.substring(
                //         0,
                //         _expression.length - 1,
                //       );
                //       _result = _expression.isEmpty ? '0' : _expression;
                //     }
                //   });
                // },
                textColor: specialColor,
              ),
              ButtonWidget(
                text: '+/-',
                color: specialBgColor,
                onPressed: () => {_onButtonPressed('+/-')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     if (_expression.isNotEmpty) {
                //       if (_expression.startsWith('-')) {
                //         _expression = _expression.substring(1);
                //       } else {
                //         _expression = '-' + _expression;
                //       }
                //       _result = _expression;
                //     }
                //   });
                // },
                textColor: specialColor,
              ),
              ButtonWidget(
                text: '/',
                color: operatorsBgColor,
                onPressed: () => {_onButtonPressed('/')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '/';
                //     _result = _expression;
                //   });
                // },
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '7',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('7')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '7';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '8',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('8')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '8';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '9',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('9')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '9';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '*',
                color: operatorsBgColor,
                onPressed: () => {_onButtonPressed('*')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '*';
                //     _result = _expression;
                //   });
                // },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '4',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('4')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '4';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '5',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('5')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '5';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '6',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('6')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '6';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '-',
                color: operatorsBgColor,
                onPressed: () => {_onButtonPressed('-')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '-';
                //     _result = _expression;
                //   });
                // },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '1',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('1')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '1';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '2',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('2')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '2';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '3',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('3')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '3';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '+',
                color: operatorsBgColor,
                onPressed: () => {_onButtonPressed('+')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '+';
                //     _result = _expression;
                //   });
                // },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: '%',
                color: operatorsBgColor,
                onPressed: () => {_onButtonPressed('%')},
                //   () {
                //     _expression = (_result == '0') ? '' : _result.toString();
                //     setState(() {
                //       _expression += '%';
                //       _result = _expression;
                //     });
                //   },
              ),
              ButtonWidget(
                text: '0',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('0')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '0';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '.',
                color: numbersBgColor,
                onPressed: () => {_onButtonPressed('.')},
                // () {
                //   _expression = (_result == '0') ? '' : _result.toString();
                //   setState(() {
                //     _expression += '.';
                //     _result = _expression;
                //   });
                // },
              ),
              ButtonWidget(
                text: '=',
                color: answerBgColor,
                onPressed: () => {_onButtonPressed('=')},
                // () {
                //   setState(() {
                //     try {
                //       // Parse the expression using math_expressions package
                //       final expression = math_expressions.Parser().parse(
                //         _expression.replaceAll('x', '*'),
                //       );
                //       final contextModel = math_expressions.ContextModel();
                //       var result = expression.evaluate(
                //         math_expressions.EvaluationType.REAL,
                //         contextModel,
                //       );
                //       _result = result.toString();
                //     } catch (e) {
                //       _result = 'Error';
                //     }
                //   });
                // },
                textColor: specialColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
