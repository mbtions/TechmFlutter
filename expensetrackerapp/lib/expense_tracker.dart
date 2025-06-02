import 'package:expensetrackerapp/Model/expense.dart';
import 'package:expensetrackerapp/edit_expense_dialog.dart';
import 'package:expensetrackerapp/expense_list.dart';
import 'package:expensetrackerapp/input_text_field.dart';
import 'package:expensetrackerapp/new_expense.dart';
import 'package:flutter/material.dart';

// class ExpenseTrackerApp extends StatelessWidget {
//   const ExpenseTrackerApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Expense Tracker',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: ExpenseTracker(),
//       // routes: {
//       //   '/add-expense': (context) => AddExpenseScreen(),
//       // },
//     );
//   }
// }

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  ExpenseTrackerState createState() => ExpenseTrackerState();
}

class ExpenseTrackerState extends State<ExpenseTracker> {
  List<Expense> registeredExpenses = [
    Expense(
      title: 'Museum Visit',
      amount: 10,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
    Expense(
      title: 'Flutter Course',
      amount: 4.35,
      date: DateTime.now(),
      category: Category.other,
    ),
    Expense(
      title: 'Flight to Paris',
      amount: 1000,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Electricity Bill',
      amount: 50,
      date: DateTime.now(),
      category: Category.utilities,
    ),
    Expense(
      title: 'Groceries',
      amount: 200,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Movie Night',
      amount: 15,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  Category selectedCategory = Category.other; // Default category

  void openExpenseAdderOverlay() {
    showModalBottomSheet(context: context, builder: (context) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Add Expense',
            icon: const CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromRGBO(187, 222, 251, 1),
              child: Icon(Icons.add, color: Colors.blue, size: 30),
            ),
            onPressed: () {
              openExpenseAdderOverlay();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Expenses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Card(
                        color: Colors.purple.shade100,
                        child: Container(
                          height: 100,
                          width: 65,
                          child: Icon(
                            Icons.movie,
                            color: Colors.purple.shade700,
                          ),
                        ),
                      ),
                      // Text('Entertainement'),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Colors.orange.shade100,
                        child: Container(
                          height: 100,
                          width: 65,
                          child: Icon(
                            Icons.lightbulb,
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ),
                      // Text('Utilities'),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Colors.green.shade100,
                        child: Container(
                          height: 100,
                          width: 65,
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                      // Text('Food'),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Colors.blue.shade100,
                        child: Container(
                          height: 100,
                          width: 65,
                          child: Icon(
                            Icons.airplanemode_active,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                      // Text('Travel'),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        color: Colors.grey.shade100,
                        child: Container(
                          height: 100,
                          width: 65,
                          child: Icon(
                            Icons.category,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      // Text('Other'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'All Expenses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(child: ExpenseList(expenses: registeredExpenses)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialog
        },
        backgroundColor: Colors.blue.shade100,
        tooltip: 'Add Expense',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(Icons.add, color: Colors.blue),
      ),
    );
  }
}
