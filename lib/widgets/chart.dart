import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> receptionTransaction;
  Chart(this.receptionTransaction);

  List<Map<String, Object>> get groupedTransactionVAlue {
    return List.generate(1, (index) {
      var totalSum = 0.0;
      for (var i = 0; i < receptionTransaction.length; i++) {
        totalSum += receptionTransaction[i].amount;
      }
      return {'total': totalSum};
    });
  }

  // double get totalSpending {
  //   return groupedTransactionVAlue.fold(0.0,(sum ,item) {
  //     return sum + item['amount'];
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      return Card(
        elevation: 3,
        margin: EdgeInsets.all(5),
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: groupedTransactionVAlue.map((data) {
              return Container(
                height: Constraints.maxHeight * 0.09,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'The total is :',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      receptionTransaction.isEmpty ? '' : '${data['total']} ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
