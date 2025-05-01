import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';

class PlayerTurnBar extends StatefulWidget {
  const PlayerTurnBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return PlayerTurnBarState();
  }
}

class PlayerTurnBarState extends State<PlayerTurnBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Player A's Turn", style: textStyle),
      ),
    );
  }
}
