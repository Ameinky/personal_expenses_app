import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/chart.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

import '../models/transaction.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: DateTime.now().toString(),
      amount: 10.99,
      date: DateTime.now(),
      title: 'laptop hp',
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 30.99,
      date: DateTime.now(),
      title: 'laptop Lenovo',
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 13.99,
      date: DateTime.now(),
      title: 'Sumsumng A10',
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 45.99,
      date: DateTime.now(),
      title: 'Sumsumng',
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 9.99,
      date: DateTime.now(),
      title: 'Charger',
    ),
  ];

  void _addNewTransaction(
    String txTitle,
    double txAmount,
  ) {
    final addNewTx = Transaction(
      id: DateTime.now().toString(),
      date: DateTime.now(),
      amount: txAmount,
      title: txTitle,
    );

    setState(() {
      _userTransactions.add(addNewTx);
    });
  }

  void StartAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addNewTransaction, _userTransactions);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('Personal Expenses'),
      centerTitle: true,
    );

    final txListWidget = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.3,
        child: TransactionList(_userTransactions, _deleteTransaction));

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          if (!isLandscape)
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.09,
                child: Chart(_userTransactions)),
          if (!isLandscape) txListWidget,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => StartAddTransaction(context),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
