import 'package:flutter/material.dart';
import 'package:mymealapp/model/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.meal,
    required this.mealStyleColor,
  });

  final Meal meal;
  final Color mealStyleColor;

  Widget buildListContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 210,
      width: double.infinity,
      child: child,
    );
  }

  Widget mealContent(List<String> list) {
    return ListView.builder(
      itemCount: meal.ingredients.length,
      itemBuilder: (context, index) => Card(
        elevation: 6,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            list[index],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  String formatEnumToString(String text) {
    return text.split('.').last[0].toUpperCase() +
        text.split('.').last.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                meal.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: mealStyleColor.withAlpha(50),
                          child: Icon(Icons.schedule, color: mealStyleColor),
                        ),
                        const SizedBox(width: 6),
                        Text("${meal.duration.toInt().toString()} min"),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: mealStyleColor.withAlpha(50),
                          child: Icon(Icons.work, color: mealStyleColor),
                        ),
                        const SizedBox(width: 6),
                        Text(formatEnumToString(meal.complexity.toString())),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: mealStyleColor.withAlpha(50),
                          child: Icon(
                            Icons.attach_money,
                            color: mealStyleColor,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(formatEnumToString(meal.affordability.toString())),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "Ingredients",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              buildListContainer(
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 2,
                    color: mealStyleColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  "Recipe",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              buildListContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: mealStyleColor.withAlpha(50),
                        child: Text(
                          '#${index + 1}',
                          style: TextStyle(color: mealStyleColor),
                        ),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Chip(
                          backgroundColor: Colors.green.shade200,
                          label: Row(
                            children: [
                              const Text('Vegan'),
                              const SizedBox(width: 6),
                              meal.isVegan
                                  ? Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.green.shade700,
                                    )
                                  : Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.red.shade700,
                                    ),
                            ],
                          ),
                        ),
                        // const SizedBox(width: 6),
                        // meal.isVegan
                        //     ? Icon(
                        //         Icons.check_circle_rounded,
                        //         color: Colors.green.shade700,
                        //       )
                        //     : Icon(
                        //         Icons.cancel_rounded,
                        //         color: Colors.red.shade700,
                        //       ),
                      ],
                    ),
                    Row(
                      children: [
                        Chip(
                          backgroundColor: Colors.orange.shade200,
                          label: Row(
                            children: [
                              const Text('Vegetarian'),
                              const SizedBox(width: 6),
                              meal.isVegetarian
                                  ? Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.green.shade700,
                                    )
                                  : Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.red.shade700,
                                    ),
                            ],
                          ),
                        ),
                        // const SizedBox(width: 6),
                        // meal.isVegetarian
                        //     ? Icon(
                        //         Icons.check_circle_rounded,
                        //         color: Colors.green.shade700,
                        //       )
                        //     : Icon(
                        //         Icons.cancel_rounded,
                        //         color: Colors.red.shade700,
                        //       ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Chip(
                          backgroundColor: Colors.blue.shade200,
                          label: Row(
                            children: [
                              const Text('Gluten-Free'),
                              const SizedBox(width: 6),
                              meal.isGlutenFree
                                  ? Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.green.shade700,
                                    )
                                  : Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.red.shade700,
                                    ),
                            ],
                          ),
                        ),
                        // const SizedBox(width: 6),
                        // meal.isGlutenFree
                        //     ? Icon(
                        //         Icons.check_circle_rounded,
                        //         color: Colors.green.shade700,
                        //       )
                        //     : Icon(
                        //         Icons.cancel_rounded,
                        //         color: Colors.red.shade700,
                        //       ),
                      ],
                    ),
                    Row(
                      children: [
                        Chip(
                          backgroundColor: Colors.purple.shade200,
                          label: Row(
                            children: [
                              const Text('Lactose-Free'),
                              const SizedBox(width: 6),
                              meal.isLactoseFree
                                  ? Icon(
                                      Icons.check_circle_rounded,
                                      color: Colors.green.shade700,
                                    )
                                  : Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.red.shade700,
                                    ),
                            ],
                          ),
                        ),
                        // const SizedBox(width: 6),
                        // meal.isLactoseFree
                        //     ? Icon(
                        //         Icons.check_circle_rounded,
                        //         color: Colors.green.shade700,
                        //       )
                        //     : Icon(
                        //         Icons.cancel_rounded,
                        //         color: Colors.red.shade700,
                        //       ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
