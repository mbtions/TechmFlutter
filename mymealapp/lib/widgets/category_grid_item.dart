import 'package:flutter/material.dart';
import 'package:mymealapp/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onCategoryGridItemTap,
  });

  final Category category;
  final void Function(BuildContext context, Category category)
  onCategoryGridItemTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [category.color.withAlpha(0), category.color.withAlpha(255)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        splashColor: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(16),
        onTap: () => onCategoryGridItemTap(context, category),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
