import 'package:expenses/Model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyhomePage());
  }
}

class MyhomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesa Pessoais'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                child: Text('Gráfico'),
                elevation: 5,
                color: Colors.blue,
              ),
            ),
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Valor (R\$)',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('Nova Transação'),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.purple,
                              primary: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
