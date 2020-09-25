import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/register_api.dart';
import 'package:philial/view/login_register/change_done.dart';
import 'package:philial/view/login_register/reset_done.dart';


class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  bool _isLoading = false;
  final _formkey = GlobalKey<FormState>();

  String currentPass;
  String email;
  String password;
  String confirmPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
          'Change Password',
          //textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 2.3 * textm,
              color: defaultBlue,
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
                'Fill in the following details to change your password',
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
                      'Email Address',
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
                        onChanged: (value) {
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
                    SizedBox(
                      height: 2 * heightm,
                    ),
                    Text(
                      'Current Password',
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
                      padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
                      decoration: ShapeDecoration(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(3 * widthm),
                        ),
                        onChanged: (value) {
                          currentPass = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Current Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2 * heightm,
                    ),
                    Text(
                      'New Password',
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
                      padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
                      decoration: ShapeDecoration(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(3 * widthm),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'New Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2 * heightm,
                    ),
                    Text(
                      'Confirm New Password',
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
                      padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
                      decoration: ShapeDecoration(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(3 * widthm),
                        ),
                        onChanged: (value) {
                          confirmPass = value;
                        },
                        validator: (String value) {
                          if (value != password) {
                            return 'Passwords do not match';
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
                    _passwordChange();
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
      ),
    );
  }

  _passwordChange() async {
    var res;

    var data = {};
//    var data = {
//      "current_password": currentPass,
//      "email": email,
//      "new_password": password,
//      "otpcode": "string"
//    };
//
//    print('reset data $data');

    var url = '${ipAddress}api/users/updatePassword?currentPassword=$currentPass&email=$email&newPassword=$password';
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
        res =
        await changePassword(data, url).timeout(const Duration(seconds: 30));
        var body = json.decode(res.body);

        print('change success response: $body');
        if (res.statusCode == 200) {
          Navigator.push(
              context,
              PageTransition(
                  child: ChangeDone(),
                  type: PageTransitionType.rightToLeftWithFade));
          showToast(context, '${body['message']}');
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
