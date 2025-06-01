import 'package:expensetrackerapp/Model/expense.dart';
import 'package:expensetrackerapp/expense_item_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  List<Expense> expenses;

  ExpenseList({required this.expenses, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, // Replace with your actual expense count
      itemBuilder: (context, index) {
        return ExpenseItemCard(expense: expenses[index]);
      },
    );
  }
}
