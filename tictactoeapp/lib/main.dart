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

// import 'package:flutter/material.dart';
// import 'package:tictactoeapp/constants.dart';
// import 'package:tictactoeapp/widgets/grid.dart';
// import 'package:tictactoeapp/widgets/players_panel.dart';
// import 'package:tictactoeapp/widgets/player_turn_bar.dart';

// void main() {
//   runApp(const MyTicTacToeApp());
// }

// class MyTicTacToeApp extends StatelessWidget {
//   const MyTicTacToeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // appBar: AppBar(title: Text('')),
//         body: SafeArea(child: TicTacToe()),
//         backgroundColor: appBgColor,
//       ),
//     );
//   }
// }

// class TicTacToe extends StatelessWidget {
//   const TicTacToe({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         PlayersPanel(),
//         SizedBox(height: 50),
//         Grid(),
//         SizedBox(height: 50),
//         PlayerTurnBar(),
//       ],
//     );
//   }
// }
