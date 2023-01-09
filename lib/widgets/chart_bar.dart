import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendinAmount;
  final double spendingPctofTotal;
  ChartBar(
      {required this.label,
      required this.spendinAmount,
      required this.spendingPctofTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('\$${spendinAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPctofTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ]),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
