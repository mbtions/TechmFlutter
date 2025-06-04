import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expensetrackerapp/Model/expense.dart';

final formatter = DateFormat().add_yMd();

class NewExpense extends StatefulWidget {
  final void Function(Expense) onAddExpense;
  NewExpense({required this.onAddExpense});

  @override
  State<NewExpense> createState() => NewExpenseState();
}

class NewExpenseState extends State<NewExpense> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  DateTime? selectedDate = DateTime.now();
  Category selectedCategory = Category.other;

  saveNewExpense() {
    if (validate(titleController.text, amountController.text) != "\n") {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error: Invalid Input"),
          content: Text(
            validate(titleController.text.trim(), amountController.text.trim()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      Expense newExpense = Expense(
        title: titleController.text,
        amount: double.parse(amountController.text),
        date: selectedDate!,
        category: selectedCategory,
      );
      widget.onAddExpense(newExpense);
      Navigator.of(context).pop();
    }
  }

  String validate(String title, String amount) {
    String titleErrorText = "", amountErrorText = "";
    double doubleAmount;
    if (title == null || title.isEmpty) {
      titleErrorText = "Enter a Title";
    }

    if (amount.isEmpty) {
      amountErrorText = "Enter an amount";
    } else {
      try {
        doubleAmount = double.parse(amount);
        if (doubleAmount.isNegative) {
          amountErrorText = "Enter a positive amount";
        }
      } catch (error) {
        amountErrorText = "Enter a valid amount";
      }
    }
    return "$titleErrorText\n$amountErrorText";
  }

  openDatePicker() async {
    DateTime firstDate = DateTime(2025, 1, 1);
    DateTime lastDate = DateTime(2025, 12, 31);

    selectedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      this.selectedDate = selectedDate!;
    });
  }

  String getFormattedDate(date) {
    return formatter.format(date ?? DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add New Expense',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  maxLength: 50,
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: '\$',
                          labelText: 'Amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          Text(getFormattedDate(selectedDate)),
                          IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () {
                              // Implement date picker logic here
                              openDatePicker();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    DropdownMenu(
                      label: const Text('Category'),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: Category.food, label: 'Food'),
                        DropdownMenuEntry(
                          value: Category.utilities,
                          label: 'Utilities',
                        ),
                        DropdownMenuEntry(
                          value: Category.entertainment,
                          label: 'Entertainment',
                        ),
                        DropdownMenuEntry(
                          value: Category.travel,
                          label: 'Travel',
                        ),
                        DropdownMenuEntry(value: Category.work, label: 'Work'),
                        DropdownMenuEntry(
                          value: Category.other,
                          label: 'Other',
                        ),
                      ],
                      onSelected: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        saveNewExpense();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            );
            // );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Add New Expense',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        saveNewExpense();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLength: 50,
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: '\$',
                          labelText: 'Amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownMenu(
                        label: const Text('Category'),
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                            value: Category.food,
                            label: 'Food',
                          ),
                          DropdownMenuEntry(
                            value: Category.utilities,
                            label: 'Utilities',
                          ),
                          DropdownMenuEntry(
                            value: Category.entertainment,
                            label: 'Entertainment',
                          ),
                          DropdownMenuEntry(
                            value: Category.travel,
                            label: 'Travel',
                          ),
                          DropdownMenuEntry(
                            value: Category.work,
                            label: 'Work',
                          ),
                          DropdownMenuEntry(
                            value: Category.other,
                            label: 'Other',
                          ),
                        ],
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        Text(getFormattedDate(selectedDate)),
                        IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            openDatePicker();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
              ],
            );
          }
        },
      ),
    );
  }
}
