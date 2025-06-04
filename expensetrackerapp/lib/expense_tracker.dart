import 'package:expensetrackerapp/Model/expense.dart';
import 'package:expensetrackerapp/components/expense_bar_chart.dart';
import 'package:expensetrackerapp/components/expense_list.dart';
import 'package:expensetrackerapp/components/simple_bar_chart.dart';
import 'package:expensetrackerapp/main.dart';
import 'package:expensetrackerapp/new_expense.dart';
import 'package:flutter/material.dart';

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
    showModalBottomSheet(
      context: context,
      builder: (context) => NewExpense(onAddExpense: addExpense),
    );
  }

  addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
      //  This is the optimized to use a snackbar, why? (reason)
      // and what is the other way which is not considered optimized => The one discussed in the documentation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("New expense added"),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          elevation: 6,
        ),
      );
    });
  }

  removeExpense(Expense expense, int index) {
    setState(() {
      registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense deleted'),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              // registeredExpenses.add(expense);
              // on the same index, it inserts the expense
              registeredExpenses.insert(index, expense);
            });
          },
        ),
        duration: Duration(seconds: 5),
        elevation: 6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Add Expense',
            icon: const CircleAvatar(
              // radius: 30,
              backgroundColor: Color.fromRGBO(187, 222, 251, 1),
              child: Icon(Icons.add, color: Colors.blue, size: 30),
            ),
            onPressed: () {
              openExpenseAdderOverlay();
            },
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Color.fromRGBO(187, 222, 251, 1),
              child: Icon(
                themeNotifier.isDarkMode
                    ? Icons.nightlight_round
                    : Icons.wb_sunny,
                color: Colors.blue,
              ),
            ),
            onPressed: () => setState(() => themeNotifier.toggleTheme()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: screenWidth < 500
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Weekly Expenses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(8.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue.shade50,
                  //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Column(
                  //         children: [
                  //           Card(
                  //             color: Colors.purple.shade100,
                  //             child: Container(
                  //               height: 100,
                  //               width: 65,
                  //               child: Icon(
                  //                 Icons.movie,
                  //                 color: Colors.purple.shade700,
                  //               ),
                  //             ),
                  //           ),
                  //           // Text('Entertainement'),
                  //         ],
                  //       ),
                  //       Column(
                  //         children: [
                  //           Card(
                  //             color: Colors.orange.shade100,
                  //             child: Container(
                  //               height: 100,
                  //               width: 65,
                  //               child: Icon(
                  //                 Icons.lightbulb,
                  //                 color: Colors.orange.shade700,
                  //               ),
                  //             ),
                  //           ),
                  //           // Text('Utilities'),
                  //         ],
                  //       ),
                  //       Column(
                  //         children: [
                  //           Card(
                  //             color: Colors.green.shade100,
                  //             child: Container(
                  //               height: 100,
                  //               width: 65,
                  //               child: Icon(
                  //                 Icons.fastfood,
                  //                 color: Colors.green.shade700,
                  //               ),
                  //             ),
                  //           ),
                  //           // Text('Food'),
                  //         ],
                  //       ),
                  //       Column(
                  //         children: [
                  //           Card(
                  //             color: Colors.blue.shade100,
                  //             child: Container(
                  //               height: 100,
                  //               width: 65,
                  //               child: Icon(
                  //                 Icons.airplanemode_active,
                  //                 color: Colors.blue.shade700,
                  //               ),
                  //             ),
                  //           ),
                  //           // Text('Travel'),
                  //         ],
                  //       ),
                  //       Column(
                  //         children: [
                  //           Card(
                  //             color: Colors.grey.shade100,
                  //             child: Container(
                  //               height: 100,
                  //               width: 65,
                  //               child: Icon(
                  //                 Icons.category,
                  //                 color: Colors.grey.shade700,
                  //               ),
                  //             ),
                  //           ),
                  //           // Text('Other'),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  // SimpleBarChart(expenses: registeredExpenses),
                  // const SizedBox(height: 10),
                  ExpenseBarChart(expenses: registeredExpenses),
                  const SizedBox(height: 20),
                  const Text(
                    'All Expenses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ExpenseList(
                      expenses: registeredExpenses,
                      onRemoveExpense: removeExpense,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  // Expanded(
                  //   child: const Text(
                  //     'Weekly Expenses',
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SimpleBarChart(expenses: registeredExpenses),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Expanded(
                  //   child: Text(
                  //     'All Expenses',
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  Expanded(
                    child: ExpenseList(
                      expenses: registeredExpenses,
                      onRemoveExpense: removeExpense,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
