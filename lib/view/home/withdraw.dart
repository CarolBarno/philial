import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/profile_data.dart';
import 'package:philial/res/apis/register_api.dart';
import 'package:philial/view/home/home.dart';

class Withdraw extends StatefulWidget {
  @override
  _WithdrawState createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  bool _isLoading = false;
  final _formkey = GlobalKey<FormState>();

  double amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: defaultBlue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 6 * widthm,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Withdraw',
          //textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 2.3 * textm,
              color: Colors.white,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6 * widthm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6 * heightm,
              ),
              Text(
                'Make a withdrawal',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 1.8 * textm,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 4 * heightm,
              ),
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 1.8 * textm,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 1 * heightm,
                    ),
                    Container(
                      height: 6 * heightm,
                      padding:
                          EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
                      decoration: ShapeDecoration(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(3 * widthm),
                        ),
                        onChanged: (value) {
                          amount = double.parse(value);
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Amount is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5 * heightm,
              ),
              Container(
                width: 89 * widthm,
                height: 6 * heightm,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1 * widthm),
                  color: defaultBlue,
                ),
                child: MaterialButton(
                  disabledColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.fromLTRB(
                      3 * widthm, 3 * widthm, 3 * widthm, 3 * widthm),
                  onPressed: () {
                    _makeWithdrawal();
                  },
                  child: _isLoading
                      ? spinKit
                      : Text(
                          'Withdraw',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 2 * textm,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _makeWithdrawal() async {
    var res;

    var data = {};

    var url = 'v1/philial/receive-payment/initiate-B2C/${phone}/${amount}';

    print('ttttttttttt $url');
    setState(() {
      _isLoading = true;
    });

    if (!_formkey.currentState.validate()) {
      showToast(context, 'Enter valid details');

      setState(() {
        _isLoading = false;
      });

      return;
    } else {
      _formkey.currentState.save();
      try {
        res = await postData(data, url).timeout(const Duration(seconds: 30));
        var body = json.decode(res.body);

        print('response is : $body');
        if (res.statusCode == 200) {
          showToast(context, '${body['message']}');

          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: Home(), type: PageTransitionType.leftToRight));
        } else {
          showToast(context, '${body['message']}');
        }
      } on TimeoutException {
        showToast(context, 'Error: time out');
      } on SocketException {
        showToast(context, 'Error: cannot find server');
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
