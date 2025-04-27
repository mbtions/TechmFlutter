import 'dart:math';

import 'package:flutter/material.dart';

const Color _color1 = Color(0xFF027DFD);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dice Roller",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: _color1,
          centerTitle: true,
        ),
        body: DiceRoller(),
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _diceNumber = 1;

  void _rollDice() {
    setState(() {
      _diceNumber =
          Random().nextInt(6) + 1; // Generates a number between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Dice Number: $_diceNumber', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/dice-$_diceNumber.png',
            width: 300,
            height: 300,
          ),
          ElevatedButton(
            onPressed: _rollDice,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: _color1,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 20),
              shadowColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Roll Dice'),
          ),
        ],
      ),
    );
  }
}
