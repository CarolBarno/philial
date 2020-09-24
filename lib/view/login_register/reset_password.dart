import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/register_api.dart';
import 'package:philial/view/login_register/new_password.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Reset Password',
          //textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 2.3 * textm,
              color: Colors.blue,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6 * widthm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10 * heightm,
            ),
            Text(
              'Fill in the following details to reset your password',
              style: TextStyle(
                  fontSize: 1.8 * textm,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 4 * heightm,
            ),
            Text(
              'Email Address',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 1 * heightm,
            ),
            Form(
              key: _formKey,
              child: Container(
                height: 6 * heightm,
                padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
                decoration: ShapeDecoration(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(3 * widthm),
                  ),
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 4 * heightm,
            ),
            Container(
              width: 89 * widthm,
              height: 6 * heightm,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1 * widthm),
                color: Colors.blue,
              ),
              child: MaterialButton(
                disabledColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.fromLTRB(
                    3 * widthm, 3 * widthm, 3 * widthm, 3 * widthm),
                onPressed: () {
                  _passwordResetRequest();
                },
                child: _isLoading ?
                spinKit : Text(
                  'Continue',
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
    );
  }

  _passwordResetRequest() async {

    var res;
    var data={};
    var url='${ipAddress}api/users/resetPassword?email=$email';

    setState(() {
      _isLoading = true;
    });

    if (!_formKey.currentState.validate()) {
      showToast(context, 'Enter valid details');
      setState(() {
        _isLoading = false;
      });
      return;
    }else{
      _formKey.currentState.save();
      try{
        res = await resetPassword(data, url)
            .timeout(const Duration(seconds: 30));
        var body=json.decode(res.body);

    print('access reset response: $body');

        if(res.statusCode==200){
          Navigator.push(
              context,
              PageTransition(
                  child: NewPassword(email),
                  type: PageTransitionType.rightToLeftWithFade));

          showToast(context, '${body['message']}');

        } else{
          showToast(context, '${body['message']}');
        }
      } on TimeoutException{
        showToast(context, 'Error: time out');
      }on SocketException{
        showToast(context, 'Error: cannot find server');
      }
    }

    setState(() {
      _isLoading = false;
      accesstoken=res;
    });
  }

}
