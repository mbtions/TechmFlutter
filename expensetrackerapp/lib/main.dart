import 'package:expensetrackerapp/expense_tracker.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 207, 244),
);

void main() {
  runApp(
    MaterialApp(
      home: ExpenseTracker(),
      theme: ThemeData().copyWith(
        // useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.inversePrimary,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            color: kColorScheme.onPrimaryContainer,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.blue.shade900,
            fontSize: 12,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
