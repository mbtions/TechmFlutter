import 'package:expensetrackerapp/Model/expense.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseBarChart extends StatelessWidget {
  final List<Expense> expenses;

  ExpenseBarChart({required this.expenses});

  Map<Category, double> getCategoryTotals() {
    final totals = <Category, double>{};
    for (var expense in expenses) {
      totals[expense.category] =
          (totals[expense.category] ?? 0) + expense.amount;
    }
    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = getCategoryTotals();

    final barGroups = categoryTotals.entries.toList().asMap().entries.map((
      entry,
    ) {
      final index = entry.key;
      final category = entry.value.key;
      final total = entry.value.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: total,
            color: _getCategoryColor(category),
            borderRadius: BorderRadius.circular(4),
            width: 22,
          ),
        ],
      );
    }).toList();

    return AspectRatio(
      aspectRatio: 1.8,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: categoryTotals.values.isNotEmpty
              ? (categoryTotals.values.reduce((a, b) => a > b ? a : b) + 50)
              : 100,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final category = categoryTotals.keys.toList()[value.toInt()];
                  return SideTitleWidget(
                    // axisSide: meta.axisSide,
                    space: 8.0,
                    meta: meta,
                    child: Text(
                      _getCategoryName(category),
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: barGroups,
          gridData: FlGridData(show: true),
        ),
      ),
    );
  }

  String _getCategoryName(Category category) {
    switch (category) {
      case Category.food:
        return 'Food';
      case Category.travel:
        return 'Travel';
      case Category.entertainment:
        return 'Fun';
      case Category.utilities:
        return 'Utilities';
      case Category.work:
        return 'Work';
      case Category.other:
        return 'Other';
    }
  }

  Color _getCategoryColor(Category category) {
    switch (category) {
      case Category.food:
        return Colors.green;
      case Category.travel:
        return Colors.blue;
      case Category.entertainment:
        return Colors.purple;
      case Category.utilities:
        return Colors.orange;
      case Category.work:
        return Colors.indigo;
      case Category.other:
        return Colors.grey;
    }
  }
}
