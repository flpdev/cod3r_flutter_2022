import 'dart:math';

import 'package:expenses/Model/transaction.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Compra Ração Dog',
      value: 169.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Remédio Covid',
      value: 58.11,
      date: DateTime.now(),
    )
  ];

  // Função utilizada para comunicação indireta entre filho e pai
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TransactionList(_transactions), TransactionForm()],
    );
  }
}
