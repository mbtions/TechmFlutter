import 'package:flutter/material.dart';
import 'package:mymealapp/data/dummy_data.dart';
import 'package:mymealapp/widgets/CategoryGridItem.dart';
import 'package:mymealapp/model/category.dart';

class HomeScreen extends StatelessWidget {
  // List<FoodCategory> categories = availableCategories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Your Category'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5,
          ),
          children: [
            for (Category category in availableCategories)
              CategoryGridItem(category: category),
          ],
        ),
      ),
    );
  }
}
