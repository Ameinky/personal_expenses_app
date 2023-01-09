import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset('assets/waiting.png'),
            )
          ])
        : Expanded(
            child: ListView.builder(
                itemCount: widget.transactions.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      elevation: 4,
                      child: Expanded(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 50,
                            child: Container(
                              margin: EdgeInsets.all(1),
                              child: Text(
                                '\$${widget.transactions[index].amount}',
                                style: TextStyle(),
                              ),
                            ),
                          ),
                          title:
                              Text(widget.transactions[index].title.toString()),
                          subtitle: Text(DateFormat('yyy/MM/dd')
                              .format(widget.transactions[index].date)),
                          trailing: IconButton(
                            onPressed: () => widget.deleteTransaction(
                                widget.transactions[index].id),
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                            ),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
  }
}
