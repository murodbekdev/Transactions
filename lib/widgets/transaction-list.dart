import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trasnaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function deleteTx;
  const TransactionList(this._transactions, this.deleteTx, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: _transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transacton added yet!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'lib/assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 35,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${_transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () => deleteTx(_transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
