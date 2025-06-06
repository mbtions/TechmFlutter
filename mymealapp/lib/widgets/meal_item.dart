import 'package:flutter/material.dart';
import 'package:mymealapp/model/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    // required this.title,
    // required this.imageUrl,
    // required this.duration,
    // required this.complexity,
    // required this.affordability,
    required this.mealStyleColor,
    required this.onMealItemTap,
  });

  final Meal meal;
  // final String title;
  // final String imageUrl;
  // final String duration;
  // final String complexity;
  // final String affordability;
  final Color mealStyleColor;
  final void Function(BuildContext, Meal meal) onMealItemTap;

  String formatEnumToString(String text) {
    return text.split('.').last[0].toUpperCase() +
        text.split('.').last.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => onMealItemTap(context, meal),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    meal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Container(
                    color: Colors.white.withAlpha(170),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.schedule,
                                    // color: Colors.black,
                                    color: mealStyleColor,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "${meal.duration.toInt().toString()} min",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.work,
                                    // color: Colors.black
                                    color: mealStyleColor,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  formatEnumToString(
                                    meal.complexity.toString(),
                                  ),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  // backgroundColor: mealStyleColor.withAlpha(50),
                                  child: Icon(
                                    Icons.attach_money,
                                    // color: Colors.black,
                                    color: mealStyleColor,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  formatEnumToString(
                                    meal.affordability.toString(),
                                  ),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
