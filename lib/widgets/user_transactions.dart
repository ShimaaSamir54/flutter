import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:personalexpensesapp/models/transaction.dart';
import 'package:personalexpensesapp/widgets/transaction_list.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction('1', 'New Shoes', 9.2, DateTime.now()),
    Transaction('2', 'New Bags ', 6.5, DateTime.now()),
    Transaction('3', 'New One ', 3.2,  DateTime.now()),




  ];
  late String title;

  late String amount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _addNewTransaction(String title, double amount) {
    final newTx =
        Transaction(DateTime.now().toString(), title, amount, DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(transactions),

      ],
    );
  }
}
