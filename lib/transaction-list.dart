import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/trasnaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactons;
  TransactionList(this._transactons);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: _transactons.map(
            (e) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    foregroundDecoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 2),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '\$${e.amount}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        e.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(e.date),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ));
            },
          ).toList(),
        ),
      ),
    );
  }
}
