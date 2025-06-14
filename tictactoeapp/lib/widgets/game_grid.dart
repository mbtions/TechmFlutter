import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';

class GameGrid extends StatefulWidget {
  const GameGrid({super.key});

  @override
  State<GameGrid> createState() {
    return GameGridState();
  }
}

class GameGridState extends State<GameGrid> {
  List<String> gameState = ["", "", "", "", "", "", "", "", "", ""];
  String turnSymbol = "X";
  String gameStateText = "Turn: X";
  bool win = false;
  List<bool> winStatus = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  String resetButtonText = "Reset Game";
  // bool showReset = false;

  onGameGridButtonClick(int index) {
    setState(() {
      if (win != true) {
        if (gameState[index] == "") {
          gameState[index] = turnSymbol;
          String result = checkWin();
          if (result == "win") {
            gameStateText = "Winner: $turnSymbol";
            // showReset = true;
            turnSymbol = "";
            resetButtonText = "New Game";
          } else if (result == "draw") {
            gameStateText = "It's a Tie";
            resetButtonText = "New Game";
            // showReset = true;
          } else {
            if (turnSymbol == "X") {
              turnSymbol = "O";
            } else {
              turnSymbol = "X";
            }
            gameStateText = 'Turn: $turnSymbol';
            resetButtonText = "Reset Game";
            // showReset = false;
          }
        }
      }
    });
  }

  String checkWin() {
    List<List<int>> winStates = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7],
    ];

    for (int i = 0; i < 8; i++) {
      int m = winStates[i][0];
      int n = winStates[i][1];
      int o = winStates[i][2];

      if (gameState[m] == turnSymbol &&
          gameState[n] == turnSymbol &&
          gameState[o] == turnSymbol &&
          turnSymbol != "") {
        setState(() {
          winStatus[m] = true;
          winStatus[n] = true;
          winStatus[o] = true;
          win = true;
        });
        return "win";
      }
    }

    for (int i = 1; i < gameState.length; i++) {
      if (gameState[i] == "") {
        return "game on";
      }
    }

    return "draw";
  }

  onResetPress() {
    setState(() {
      gameState = ["", "", "", "", "", "", "", "", "", ""];
      winStatus = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
      ];
      win = false;
      turnSymbol = "X";
      gameStateText = "Turn: X";
      resetButtonText = "Reset Game";
      // showReset = false;
    });
  }

  resetButtonBuild() {
    return ElevatedButton(
      onPressed: onResetPress,
      child: Text(resetButtonText, style: resetButtonTextStyle),
    );
  }

  Widget buildButton(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 120,
        height: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor:
                winStatus[index] == true ? Colors.amber.shade50 : Colors.blue,
            elevation: 6,
          ),
          onPressed: () => {onGameGridButtonClick(index)},
          child: Text(
            gameState[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              gameStateText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: appTextColor,
                fontSize: 40,
              ),
            ),
            Row(children: [buildButton(1), buildButton(2), buildButton(3)]),
            Row(children: [buildButton(4), buildButton(5), buildButton(6)]),
            Row(children: [buildButton(7), buildButton(8), buildButton(9)]),
            // SizedBox(height: 20),
            // resetButtonBuild(),
          ],
        ),
      ),
    );
  }
}
