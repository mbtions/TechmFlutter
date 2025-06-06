import 'package:flutter/material.dart';
import 'package:mymealapp/Screens/meals_screen.dart';
import 'package:mymealapp/data/dummy_data.dart';
import 'package:mymealapp/model/meal.dart';
import 'package:mymealapp/widgets/category_grid_item.dart';
import 'package:mymealapp/model/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    onCategorySelected(BuildContext context, Category category) {
      List<Meal> filteredMeals = dummyMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
            categoryStyleColor: category.color.withAlpha(180),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Pick Your Category'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 500) {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                children: [
                  for (Category category in availableCategories)
                    CategoryGridItem(
                      category: category,
                      onCategoryGridItemTap: onCategorySelected,
                    ),
                ],
              );
            } else {
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),

                children: [
                  for (Category category in availableCategories)
                    CategoryGridItem(
                      category: category,
                      onCategoryGridItemTap: onCategorySelected,
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
