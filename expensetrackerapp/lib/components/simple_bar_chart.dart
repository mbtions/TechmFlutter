import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expensetrackerapp/Model/expense.dart';

class SimpleBarChart extends StatelessWidget {
  final List<Expense> expenses;

  const SimpleBarChart({super.key, required this.expenses});

  Map<Category, double> getCategoryTotals() {
    Map<Category, double> totals = {
      Category.food: 0,
      Category.entertainment: 0,
      Category.travel: 0,
      Category.work: 0,
      Category.utilities: 0,
      Category.other: 0,
    };

    for (var expense in expenses) {
      totals[expense.category] = totals[expense.category]! + expense.amount;
    }

    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = getCategoryTotals();

    final List<BarChartGroupData> barGroups = [];
    int i = 0;

    categoryTotals.forEach((category, total) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [BarChartRodData(toY: total, color: Colors.blue, width: 20)],
        ),
      );
      i++;
    });

    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const labels = [
                    'Food',
                    'Entertainment',
                    'Travel',
                    'Work',
                    'Utilities',
                    'Other',
                  ];
                  return Text(labels[value.toInt()]);
                },
              ),
            ),
          ),
          barGroups: barGroups,
        ),
      ),
    );
  }
}
