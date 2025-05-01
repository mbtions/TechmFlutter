import 'package:flutter/material.dart';
import 'package:tictactoeapp/constants.dart';

// ignore: must_be_immutable
class Tile extends StatefulWidget {
  String initialSymbol = "";
  Tile(String symbol, {super.key}) {
    initialSymbol = symbol;
  }
  @override
  State<StatefulWidget> createState() {
    return TileState();
  }
}

class TileState extends State<Tile> {
  String choiceSymbol = "";
  String symbol = "";

  @override
  void initState() {
    super.initState();
    choiceSymbol = widget.initialSymbol;
  }

  onTilePress() {
    setState(() {
      if (symbol == "") {
        symbol = choiceSymbol;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 100,
        height: 100,
        child: GestureDetector(
          onTap: onTilePress,
          child: Card(
            margin: EdgeInsets.all(8),
            color: Colors.blue,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(symbol, style: textStyle),
          ),
        ),
      ),
    );
  }
}
