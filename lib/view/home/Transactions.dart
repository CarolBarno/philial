import 'package:flutter/material.dart';
import 'package:philial/res/apis/constant.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 6 * widthm,
              color: Colors.grey[500],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'My Transactions',
            style: TextStyle(
                fontSize: 2.3 * textm,
                color: defaultBlue,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(),
      ),
    );
  }
}
