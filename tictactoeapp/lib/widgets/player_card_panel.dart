import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';

class PlayerCardPanel extends StatefulWidget {
  String name = "", choice = "";
  PlayerCardPanel(String playerName, String playerChoice, {super.key}) {
    name = playerName;
    choice = playerChoice;
  }
  @override
  State<StatefulWidget> createState() {
    return PlayerCardState();
  }
}

class PlayerCardState extends State<PlayerCardPanel> {
  String playerChoice = "";
  String playerName = "";
  String buttonText = "edit";
  TextEditingController textControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    playerName = widget.name;
    playerChoice = widget.choice;
  }

  onEditPress() {
    setState(() {
      if (buttonText == 'edit') {
        buttonText = 'save';
      } else {
        playerName = textControler.text;
        buttonText = 'edit';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      // margin: EdgeInsets.all(2),
      child: Column(
        children: [
          buttonText == "edit"
              ? Text(
                playerName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )
              : TextField(
                style: TextStyle(color: Colors.white, fontSize: 22),
                controller: textControler,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
          Text(
            playerChoice,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: onEditPress,
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              child: Text(buttonText, style: textStyle),
            ),
          ),
        ],
      ),
    );
  }
}
