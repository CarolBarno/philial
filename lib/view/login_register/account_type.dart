import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/view/login_register/corporate_register.dart';
import 'package:philial/view/login_register/junior_register.dart';
import 'package:philial/view/login_register/register.dart';

class AccountType extends StatefulWidget {
  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10 * widthm),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Welcome to Philial',
                            style: TextStyle(
                                //color: Colors.white70,
                                fontSize: 2.2 * textm,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 3 * heightm),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 4 * heightm),
                        Text(
                          'Choose an account type:',
                          style: TextStyle(
                            //color: Colors.white70,
                            fontSize: 2.3 * textm,
                          ),
                        ),
                        SizedBox(height: 4 * heightm),
                        ButtonTheme(
                          minWidth: 70 * widthm,
                          child: RaisedButton(
                            color: defaultBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(1 * widthm),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.upToDown,
                                    child: JuniorRegister()),
                              );
                            },
                            child: Text(
                              'Junior Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2.1 * textm,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 2 * heightm),
                        ButtonTheme(
                          minWidth: 70 * widthm,
                          child: RaisedButton(
                            color: defaultBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(1 * widthm),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.upToDown,
                                    child: Register()),
                              );
                            },
                            child: Text(
                              'Individual Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2.1 * textm,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 2 * heightm),
                        ButtonTheme(
                          minWidth: 70 * widthm,
                          child: RaisedButton(
                            color: defaultBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(1 * widthm),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.upToDown,
                                    child: CorporateRegister()),
                              );
                            },
                            child: Text(
                              'Corporate Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2.1 * textm,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ])),
      ),
    );
  }
}
