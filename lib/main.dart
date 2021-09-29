import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personalexpensesapp/widgets/new_transaction.dart';
import 'package:personalexpensesapp/widgets/transaction_list.dart';

import 'models/transaction.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,// theme of the app toolbar , statusbar
         accentColor: Colors.yellowAccent// , floating button
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   late String title ;
   late String amount ;
   final titleController= TextEditingController();
   final amountController  = TextEditingController();


   final List<Transaction> transactions = [
     Transaction('1', 'New Shoes', 9.2, DateTime.now()),
     Transaction('2', 'New Bags ', 6.5, DateTime.now()),
     Transaction('3', 'New One ', 3.2,  DateTime.now()),
   ];


   void _addNewTransaction(String title, double amount) {
     final newTx =
     Transaction(DateTime.now().toString(), title, amount, DateTime.now());

     setState(() {
       transactions.add(newTx);
     });
   }


   void _startAddNewTransaction (BuildContext context){
     showModalBottomSheet(context: context, builder:(_){
       return GestureDetector(
            onTap:() {},
           child:NewTransaction(_addNewTransaction),
         behavior: HitTestBehavior.opaque,);

     },);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions:<Widget> [//Add icon to toolbar
          IconButton(
          icon:Icon(Icons.add), onPressed: () {
            _startAddNewTransaction(context);
          } , color: Colors.white,
          )

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment (Column ->height)
          crossAxisAlignment: CrossAxisAlignment.center,
          //crossAxisAlignment (Column ->Width)
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                  child: Text('Chart'),
                  color: Colors.deepOrange,
                )),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _startAddNewTransaction(context);

        },
      ),
    );
  }
}
