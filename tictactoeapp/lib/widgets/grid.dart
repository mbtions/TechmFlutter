import 'package:flutter/material.dart';
import '/widgets/tiles.dart';

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(children: [Tile(""), Tile(""), Tile("")]),
          Row(children: [Tile(""), Tile(""), Tile("")]),
          Row(children: [Tile(""), Tile(""), Tile("")]),
        ],
      ),
    );
  }
}
