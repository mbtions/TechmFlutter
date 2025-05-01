import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';

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
        color: appBgColor,
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
                      // color: Colors.white,
                      color: appTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      hintText: nameHintText,
                      hintStyle: nameHintStyle,
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: appBgColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
