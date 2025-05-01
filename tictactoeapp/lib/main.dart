import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';
import 'package:tictactoeapp/widgets/game_grid.dart';
// import 'package:tictactoeapp/widgets/grid.dart';
// import 'package:tictactoeapp/widgets/player_turn_bar.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TIC-TAC-TOE APP"),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: appBgColor,
          ),
        ),
        backgroundColor: appBgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: appBgColor),
            child: Column(
              children: [
                SizedBox(height: 20),
                PlayerPanel(),
                SizedBox(height: 30),
                // Grid(),
                GameGrid(),
                // SizedBox(height: 50),
                // PlayerTurnBar(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class PlayerPanel extends StatelessWidget {
  const PlayerPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: ,
      child: Container(
        child: Card(
          elevation: 6,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlayerNamePanel('Meenakshi', 'X'),
              Text('TIC TAC TOE', style: textStyle),
              PlayerNamePanel('Vandana', 'O'),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerNamePanel extends StatefulWidget {
  String playerInitialName = "";
  String playerChoice = "";
  PlayerNamePanel(String playerName, String choice, {super.key}) {
    playerInitialName = playerName;
    playerChoice = choice;
  }
  @override
  State<PlayerNamePanel> createState() {
    return PlayerNamePanelState();
  }
}

class PlayerNamePanelState extends State<PlayerNamePanel> {
  String playerName = '';
  String choice = '';

  @override
  initState() {
    super.initState();
    playerName = widget.playerInitialName;
    choice = widget.playerChoice;
  }

  String buttonText = "edit";

  TextEditingController textController = TextEditingController();

  onEditPress() {
    setState(() {
      if (buttonText == 'edit') {
        buttonText = 'save';
        textController.text = playerName;
      } else {
        playerName = textController.text;
        buttonText = 'edit';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color:
            //  Color.fromARGB(255, 28, 129, 211)
            appBgColor,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(width:),
              buttonText == 'edit'
                  ? Text(playerName, style: textStyle)
                  : TextField(
                    controller: textController,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(20, 150, 243, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
              SizedBox(height: 8),
              Text(choice, style: textStyle),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: onEditPress,
                style: ElevatedButton.styleFrom(textStyle: textStyle),
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
