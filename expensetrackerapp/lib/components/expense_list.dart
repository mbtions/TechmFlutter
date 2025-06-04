import 'package:expensetrackerapp/Model/expense.dart';
import 'package:expensetrackerapp/expense_item_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenses;
  final void Function(Expense, int) onRemoveExpense;

  ExpenseList({
    required this.expenses,
    super.key,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    // final swipeDirection = ;
    return ListView.builder(
      itemCount: expenses.length, // Replace with your actual expense count
      itemBuilder: (context, index) {
        // return Dismissible(
        //   key: ValueKey(expenses[index]),
        //   background: Container(
        //     decoration: BoxDecoration(
        //       color: Theme.of(context).colorScheme.error,
        //       borderRadius: BorderRadius.all(Radius.circular(10)),
        //     ),
        //     margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Icon(Icons.delete, color: Colors.white, size: 30),
        //         Text("DELETE"),
        //         Text("DELETE"),
        //         Icon(Icons.delete, color: Colors.white, size: 30),
        //       ],
        //     ),
        //   ),
        //   onDismissed: (direction) {
        //     onRemoveExpense(expenses[index]);
        //   },
        //   child: ExpenseItemCard(expense: expenses[index]),
        // );
        return Dismissible(
          key: ValueKey(expenses[index]),

          // Shown when swiping LEFT ➡️ RIGHT
          background: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: Row(
              children: const [
                Icon(Icons.delete, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text("DELETE", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          // Shown when swiping RIGHT ➡️ LEFT
          secondaryBackground: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("DELETE", style: TextStyle(color: Colors.white)),
                SizedBox(width: 10),
                Icon(Icons.delete, color: Colors.white, size: 30),
              ],
            ),
          ),

          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              // Swiped right to left
              onRemoveExpense(expenses[index], index);
            } else if (direction == DismissDirection.startToEnd) {
              onRemoveExpense(expenses[index], index);
            }
          },

          child: ExpenseItemCard(expense: expenses[index]),
        );
      },
    );
  }
}
