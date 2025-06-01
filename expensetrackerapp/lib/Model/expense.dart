import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

enum Category { food, travel, entertainment, utilities, work, other }

final uuid = Uuid();
final formatter = DateFormat().add_yMd();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    // required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, amount: $amount, date: $date)';
  }

  String getFormattedDate() {
    return formatter.format(date);
  }

  Widget getCategoryIcon() {
    switch (category) {
      case Category.food:
        return CircleAvatar(
          backgroundColor: Colors.green.shade100,
          child: Icon(Icons.fastfood, color: Colors.green.shade700),
        );
      case Category.travel:
        return CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.airplanemode_active, color: Colors.blue.shade700),
        );
      case Category.entertainment:
        return CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(Icons.movie, color: Colors.purple.shade700),
        );
      case Category.utilities:
        return CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(Icons.lightbulb, color: Colors.orange.shade700),
        );
      case Category.work:
        return CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.work, color: Colors.blue.shade700),
        );
      case Category.other:
        return CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: Icon(Icons.category, color: Colors.grey.shade700),
        );
    }
  }
}
