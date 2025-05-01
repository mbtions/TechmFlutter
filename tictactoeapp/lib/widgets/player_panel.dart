import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';
import 'package:tictactoeapp/widgets/player_name_panel.dart';

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
              PlayerNamePanel('Bharadwaj', 'O'),
            ],
          ),
        ),
      ),
    );
  }
}
