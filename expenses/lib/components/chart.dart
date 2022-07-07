import 'package:expenses/Model/transaction.dart';
import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenteTransactions;
  Chart(this.recenteTransactions);

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recenteTransactions.length; i++) {
        bool sameDay = recenteTransactions[i].date.day == weekDay.day;
        bool sameMonth = recenteTransactions[i].date.month == weekDay.month;
        bool sameYear = recenteTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recenteTransactions[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr['day'].toString(),
            value: double.parse(tr['value'].toString()),
            percentage: 0.5,
          );
        }).toList(),
      ),
    );
  }
}
