// generate the code for the dialog to edit an expense
import 'package:expensetrackerapp/Model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'input_text_field.dart';

class EditExpenseDialog extends StatefulWidget {
  final Expense expense;
  final Function(Expense) onSave;

  const EditExpenseDialog({
    Key? key,
    required this.expense,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditExpenseDialogState createState() => _EditExpenseDialogState();
}

class _EditExpenseDialogState extends State<EditExpenseDialog> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  late DateTime selectedDate;
  late Category selectedCategory;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.expense.title);
    amountController = TextEditingController(
      text: widget.expense.amount.toString(),
    );
    selectedDate = widget.expense.date;
    selectedCategory = widget.expense.category;
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void saveExpense() {
    final updatedExpense = Expense(
      title: titleController.text,
      amount: double.tryParse(amountController.text) ?? 0.0,
      date: selectedDate,
      category: selectedCategory,
    );
    widget.onSave(updatedExpense);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Expense'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputTextField(controller: titleController, labelText: 'Title'),
            InputTextField(
              controller: amountController,
              labelText: 'Amount',
              keyboardType: TextInputType.number,
            ),
            ListTile(
              title: const Text('Date'),
              subtitle: Text(DateFormat.yMMMd().format(selectedDate)),
              trailing: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
              ),
            ),
            DropdownButton<Category>(
              value: selectedCategory,
              onChanged: (Category? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                }
              },
              items: Category.values.map((Category category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.toString().split('.').last.capitalize()),
                );
              }).toList(),
            ),
          ],
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(onPressed: saveExpense, child: const Text('Save')),
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return this.isEmpty ? this : '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
