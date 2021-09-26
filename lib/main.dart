import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personalexpensesapp/widgets/user_transactions.dart';



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
        primarySwatch: Colors.blue,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
           UserTransactions()

          ],
        ),
      ),
    );
  }
}
