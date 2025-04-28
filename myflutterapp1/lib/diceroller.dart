import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Dice App')),
        body: const Center(child: DiceRoller()),
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
  int diceNumber = 1;

  void rollDice() {
    setState(() {
      // diceNumber = (diceNumber % 6) + 1;
      diceNumber =
          Random().nextInt(6) + 1; // Generate a random number between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Roll the Dice', // Text widget to display the title
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 300,
          height: 300,
        ),
        // Text('Dice Number: $diceNumber', style: const TextStyle(fontSize: 24)),
        // Image(
        //   image: AssetImage('assets/images/dice-$diceNumber.png'),
        //   width: 300,
        //   height: 300,
        // ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black,
            elevation: 5,
          ),
          child: const Text('Roll Dice', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

// switch case, for in, for each, do while, break, continue, return, async await, try catch, throw, assert, final const var dynamic num int double bool String List Map Set Iterable Future Stream
