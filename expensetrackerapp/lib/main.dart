import 'package:expensetrackerapp/expense_tracker.dart';
import 'package:expensetrackerapp/theme/app_theme.dart';
import 'package:flutter/material.dart';

final ThemeNotifier themeNotifier = ThemeNotifier();
var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 207, 244),
);

void main() {
  runApp(
    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: ExpenseTracker(),
    // theme: ThemeData().copyWith(
    //   // useMaterial3: true,
    //   colorScheme: kColorScheme,
    //   appBarTheme: AppBarTheme().copyWith(
    //     backgroundColor: kColorScheme.primaryContainer,
    //   ),
    //   cardTheme: CardThemeData().copyWith(
    //     color: kColorScheme.secondaryContainer,
    //     // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //   ),
    //   floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
    //     backgroundColor: kColorScheme.primaryContainer,
    //   ),
    //   elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: kColorScheme.inversePrimary,
    //     ),
    //   ),
    //   textTheme: ThemeData().textTheme.copyWith(
    //     titleLarge: TextStyle(
    //       fontWeight: FontWeight.bold,
    //       color: kColorScheme.onSecondaryContainer,
    //       fontSize: 20,
    //     ),
    //     titleMedium: TextStyle(
    //       color: kColorScheme.onPrimaryContainer,
    //       fontSize: 16,
    //       fontWeight: FontWeight.bold,
    //     ),
    //     titleSmall: TextStyle(
    //       fontWeight: FontWeight.normal,
    //       color: Colors.blue.shade900,
    //       fontSize: 12,
    //     ),
    //   ),
    // ),
    // ),
    const ExpenseTrackerApp(),
  );
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (context, _) {
        return MaterialApp(
          title: "Expense Tracker App",
          theme: themeNotifier.currentTheme,
          home: ExpenseTracker(),
        );
      },
    );
  }
}


// adaptive dialog box for invalid entries in the new expense creation
// constraints at responsive screens
// only allow right swipe in the landscape view
// move your widget when soft keyboard opens
// calculator app media query, 
// tictactoe => GridLayout, and responsiveness
// use of const and delay
// SharedPreferences
// Online from anywhere SOCKET game for tictactoe.
// Theming Perfect
// Dark and Light Theme
