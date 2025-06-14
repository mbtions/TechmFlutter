import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';
import 'package:tictactoeapp/widgets/game_grid.dart';
import 'package:tictactoeapp/widgets/player_panel.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TIC x TAC x TOE"),
          backgroundColor: appBgColor,
          shadowColor: Colors.black,
          elevation: 6,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 136, 195, 243),
          ),
        ),
        backgroundColor: appBgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: appBgColor),
            child: Column(
              children: [
                SizedBox(height: 10),
                PlayerPanel(),
                SizedBox(height: 20),
                GameGrid(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
