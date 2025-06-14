import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';

class PlayerCardPanel extends StatefulWidget {
  late final String name, choice;
  PlayerCardPanel(String playerName, String playerChoice, {super.key}) {
    name = playerName;
    choice = playerChoice;
  }

  @override
  State<PlayerCardPanel> createState() {
    return PlayerCardState();
  }
}

class PlayerCardState extends State<PlayerCardPanel> {
  String playerChoice = "";
  String playerName = "";
  String buttonText = "edit";
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    playerName = widget.name;
    playerChoice = widget.choice;
  }

  onEditButtonPress() {
    setState(() {
      if (buttonText == 'edit') {
        buttonText = 'save';
      } else {
        playerName = textController.text;
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
              ? Text(playerName, style: textStyle)
              : TextField(
                style: TextStyle(color: Colors.white, fontSize: 22),
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  border: OutlineInputBorder(),
                  hintStyle: nameHintStyle,
                ),
              ),
          Text(playerChoice, style: textStyle),
          Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: onEditButtonPress,
              style: ElevatedButton.styleFrom(textStyle: textStyle),
              child: Text(buttonText, style: textStyle),
            ),
          ),
        ],
      ),
    );
  }
}
