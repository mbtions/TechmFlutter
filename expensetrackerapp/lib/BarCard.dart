import 'package:flutter/material.dart';

class BarCard extends StatelessWidget {
  final double percentage; // value between 0 and 1
  final String label;
  final Color fillColor;

  const BarCard({
    required this.percentage,
    required this.label,
    this.fillColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 150;
    const double cardWidth = 60;

    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: Container(
            width: cardWidth,
            height: cardHeight,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: cardHeight * percentage, // dynamic height
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
