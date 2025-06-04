import 'package:expensetrackerapp/Model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItemCard extends StatelessWidget {
  final Expense expense;

  const ExpenseItemCard({Key? key, required this.expense}) : super(key: key);

  // Color getCategoryColor() {
  //   switch (expense.category) {
  //     case Category.food:
  //       return Colors.green.shade700;
  //     case Category.work:
  //       return Colors.blue.shade700;
  //     case Category.travel:
  //       return Colors.blue.shade700;
  //     case Category.entertainment:
  //       return Colors.purple.shade700;
  //     case Category.utilities:
  //       return Colors.orange.shade700;
  //     case Category.other:
  //       return Colors.grey.shade700;
  //   }
  // }

  // drawIcon() {
  //   switch (expense.category) {
  //     case Category.food:
  //       return CircleAvatar(
  //         backgroundColor: Colors.green.shade100,
  //         child: Icon(Icons.fastfood, color: Colors.green.shade700),
  //       );
  //     case Category.travel:
  //       return CircleAvatar(
  //         backgroundColor: Colors.blue.shade100,
  //         child: Icon(Icons.airplanemode_active, color: Colors.blue.shade700),
  //       );
  //     case Category.entertainment:
  //       return CircleAvatar(
  //         backgroundColor: Colors.purple.shade100,
  //         child: Icon(Icons.movie, color: Colors.purple.shade700),
  //       );
  //     case Category.utilities:
  //       return CircleAvatar(
  //         backgroundColor: Colors.orange.shade100,
  //         child: Icon(Icons.lightbulb, color: Colors.orange.shade700),
  //       );
  //     case Category.work:
  //       return CircleAvatar(
  //         backgroundColor: Colors.blue.shade100,
  //         child: Icon(Icons.work, color: Colors.blue.shade700),
  //       );
  //     case Category.other:
  //       return CircleAvatar(
  //         backgroundColor: Colors.grey.shade100,
  //         child: Icon(Icons.category, color: Colors.grey.shade700),
  //       );
  //   }
  // }

  // String formatDateText() {
  //   var months = [ '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  //   ];
  //   return '${months[expense.date.month]} ${expense.date.day}, ${expense.date.year}';
  //   // '${expense.date.year}-${expense.date.month.toString().padLeft(2, '0')}-${expense.date.day.toString().padLeft(2, '0')}';  2025-05-30
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Column(
          children: [
            Text(
              expense.title,
              // style: Theme.of(context).textTheme.titleLarge
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
        leading: expense.getCategoryIcon(),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              // style: Theme.of(context).textTheme.titleMedium,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            Text(
              expense.getFormattedDate(),
              // style: Theme.of(context).textTheme.titleSmall,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
