import 'package:flutter/material.dart';
import 'package:mymealapp/Screens/about_meal_screen.dart';
import 'package:mymealapp/model/meal.dart';
import 'package:mymealapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
    required this.categoryStyleColor,
  });

  final String title;
  final List<Meal> meals;
  final Color categoryStyleColor;

  @override
  Widget build(BuildContext context) {
    onMealSelected(BuildContext context, Meal meal) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              MealScreen(meal: meal, mealStyleColor: categoryStyleColor),
        ),
      );
    }

    Widget mealsContent = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => Expanded(
        child: MealItem(
          meal: meals[index],
          // title: meals[index].title,
          // imageUrl: meals[index].imageUrl,
          // duration: "${meals[index].duration.toInt().toString()} min",
          // complexity: formatEnumToString(
          //   meals[index].complexity.toString(),
          // ),
          // affordability: formatEnumToString(
          //   meals[index].affordability.toString(),
          // ),
          mealStyleColor: categoryStyleColor,
          onMealItemTap: onMealSelected,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Expanded(child: mealsContent)],
              ),
            )
          : AlertDialog(
              title: Text('No Item'),
              content: Text('Sorry, no meal found!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OKAY"),
                ),
              ],
            ),
    );
  }
}
