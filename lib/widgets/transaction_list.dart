import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, this.deleteTransaction, {Key? key})
      : super(key: key);

  final List<Transaction> transactions;
  final void Function(String) deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: deleteTransaction,
                    ))
                .toList(),
          );

    // ListView.builder(
    // itemBuilder: (ctx, index) {
    //  return TransactionItem(
    //  key: ValueKey(transactions[index].id),
    //  transaction: transactions[index],
    //  deleteTransaction: deleteTransaction,
    // );

    // Following is custom layout...

    // return Card(
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         margin: const EdgeInsets.symmetric(
    //           vertical: 10,
    //           horizontal: 15,
    //         ),
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: Theme.of(context).primaryColor,
    //             width: 2,
    //           ),
    //         ),
    //         padding: const EdgeInsets.all(10),
    //         child: Text(
    //           '\$${transactions[index].amount.toStringAsFixed(2)}',
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             fontSize: 19,
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Text(
    //             transactions[index].title,
    //             style: Theme.of(context).textTheme.headline6,
    //           ),
    //           Text(
    //             DateFormat('dd/MM/yyyy')
    //                 .format(transactions[index].date),
    //             style: const TextStyle(
    //               color: Colors.grey,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    // },
    //  itemCount: transactions.length,
    // );
  }
}
