import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  final List<Transaction> transactionDate;
  NewTransaction(this.addtx, this.transactionDate);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputText = TextEditingController();
  final amountInputText = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    final enteredTitle = titleInputText.text;
    final enteredAmount = double.parse(amountInputText.text);
    if (enteredTitle.isEmpty || amountInputText == 0) {
      return;
    }

    widget.addtx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((PickedDate) {
      if (PickedDate == null) {
        selectedDate = PickedDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Container(
          padding: EdgeInsets.all(6),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              controller: titleInputText,
              onSubmitted: (_) => submitData,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            TextField(
              controller: amountInputText,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
