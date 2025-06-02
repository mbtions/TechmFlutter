import 'package:expensetrackerapp/Model/expense.dart';
import 'package:expensetrackerapp/expense_item_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  ExpenseList({
    required this.expenses,
    super.key,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, // Replace with your actual expense count
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          child: ExpenseItemCard(expense: expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
        );
      },
    );
  }
}
