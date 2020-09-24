import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/register_api.dart';
import 'package:philial/view/home/home.dart';
import 'package:philial/view/login_register/register.dart';
import 'package:philial/view/login_register/reset_password.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool hidePassword = true;
  bool isLoading = false;
  String phone = "";
  String password = "";

  void togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Form(
                  key: formKey,
                  autovalidate: true,
                  child: Container(
                    margin: EdgeInsets.all(6 * widthm),
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      // color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.all(Radius.circular(3 * widthm)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 8 * heightm,
                        ),
                        Container(
                          height: 25 * widthm,
                          width: 25 * widthm,
                          child: Image.asset(
                            "assets/images/flutter.png",
                          ),
                        ),
                        SizedBox(
                          height: 8 * heightm,
                        ),
                        TextFormField(
                          autocorrect: true,
                          onSaved: (String value) {
                            phone = value;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            hintText: 'Enter Your Phone Number...',
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 2 * textm,
                            ),
                            filled: true,
                            fillColor: Colors.white70,
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2 * widthm)),
                              borderSide: BorderSide(
                                  color: Colors.red, width: .5 * widthm),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2 * widthm)),
                              borderSide: BorderSide(
                                  color: Colors.red, width: .5 * widthm),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2 * widthm)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: .5 * widthm),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2 * widthm)),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: .5 * widthm),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3 * heightm,
                        ),
                        SizedBox(
                          width: 88 * widthm,
                          child: TextFormField(
                            autocorrect: true,
                            obscureText: hidePassword,
                            onSaved: (String value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              hintText: 'Enter Your Password...',
                              prefixIcon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  togglePasswordVisibility();
                                },
                                child: Icon(
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:
                                      hidePassword ? Colors.grey : Colors.blue,
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 2 * textm,
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2 * widthm)),
                                borderSide: BorderSide(
                                    color: Colors.red, width: .5 * widthm),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2 * widthm)),
                                borderSide: BorderSide(
                                    color: Colors.red, width: .5 * widthm),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2 * widthm)),
                                borderSide: BorderSide(
                                    color: Colors.grey, width: .5 * widthm),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2 * widthm)),
                                borderSide: BorderSide(
                                    color: Colors.grey, width: .5 * widthm),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.5 * heightm,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                fontSize: 2 * textm,
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: ResetPassword(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade));
                              },
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                    fontSize: 2 * textm,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.5 * heightm,
                        ),
                        SizedBox(
                          width: 88 * widthm,
                          child: MaterialButton(
                            disabledColor: Colors.grey,
                            color: Colors.blue,
                            minWidth: 3 * widthm,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                3 * widthm, 3 * widthm, 3 * widthm, 3 * widthm),
                            onPressed: () {
                              if (isLoading == false) {
                                formKey.currentState.save();
                                formKey.currentState.validate()
                                    ? _login()
                                    : showSnack(context);
                              }
                            },
                            child: isLoading
                                ? spinKit
                                : Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 2 * textm,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 2 * heightm,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 1.8 * textm,
                                    fontFamily: 'OpenSans'),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: Register()),
                                    );
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontSize: 2 * textm,
                                        fontFamily: 'OpenSans',
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      isLoading = true;
      accesstoken = null;
    });

    var data = {
      'username': phone,
      'password': password,
    };

    print('data is $data');

    try {
      var res = await requestToken(data['username'], data['password'])
          .timeout(const Duration(seconds: 30));

      print('access token response: $res');
      if (res != null) {
        Navigator.push(
            context,
            PageTransition(
                duration: Duration(milliseconds: 500),
                type: PageTransitionType.scale,
                child: Home()));

        print('access token not null response: $res');
        showToast(context, "Login successful");
      } else {
        print("access token null response  $res");
        showToast(context, "Invalid login credentials");
      }
    } on TimeoutException catch (_) {
      showToast(context, 'Time out');
    } on SocketException catch (_) {
      showToast(context, 'Unable to connect');
    } on Error catch (e) {
      print('error is>>>>$e');
    }

    setState(() {
      data = null;
      isLoading = false;
      phone = null;
      password = null;
    });
  }


  showSnack(BuildContext context) {
    final snackBar = SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.yellow,
        content: Container(
          height: ScreenUtil().setHeight(80),
          child: Center(
            child: Text(
              'Please enter valid login details',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

}
