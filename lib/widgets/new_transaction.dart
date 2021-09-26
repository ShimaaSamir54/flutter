import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:personalexpensesapp/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);
  void submitData (){

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount<=0)
      return ; // return here means stop function exceution
    addTx(enteredTitle , enteredAmount);

  }


  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.numberWithOptions(signed :true, decimal: true), // for number input decimal keyborad
                  onSubmitted: (_) => submitData(),
                ),
                TextButton(
                  child: Text('Add Transaction'),
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: submitData,

                )
              ],
            )));
  }

}
