import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat().add_yMd();

class NewExpense extends StatefulWidget {
  NewExpense({Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => NewExpenseState();
}

class NewExpenseState extends State<NewExpense> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  DateTime? selectedDate = DateTime.now();

  openDatePicker() async {
    // showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(2000),
    //   lastDate: DateTime(2100),
    // ).then((selectedDate) {
    //   if (selectedDate != null) {
    //     // Handle the selected date
    //     setState(() {
    //       this.selectedDate = selectedDate;
    //     });
    //   }
    // });
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

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
      child: Column(
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
          const SizedBox(height: 8),
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
          const SizedBox(height: 8),
          Row(
            children: [
              // DropdownButton<Category>
              DropdownMenu(
                label: const Text('Category'),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 'food', label: 'Food'),
                  DropdownMenuEntry(value: 'utilities', label: 'Utilities'),
                  DropdownMenuEntry(
                    value: 'entertainment',
                    label: 'Entertainment',
                  ),
                  DropdownMenuEntry(
                    value: 'transportation',
                    label: 'Transportation',
                  ),
                  DropdownMenuEntry(value: 'other', label: 'Other'),
                ],
                onSelected: (value) {
                  // Handle category selection
                  print('Selected category: $value');
                },
              ),
              Spacer(),
              ElevatedButton(onPressed: () {}, child: const Text('Cancel')),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
