import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/view/login_register/login.dart';

class ResetDone extends StatefulWidget {
  @override
  _ResetDoneState createState() => _ResetDoneState();
}

class _ResetDoneState extends State<ResetDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6 * widthm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20 * heightm,
              ),
              Container(
                height: 25 * widthm,
                width: 25 * widthm,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.done,
                  size: 20 * widthm,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5 * heightm,
              ),
              Text(
                'Password Reset',
                style: TextStyle(
                    fontSize: 2.3 * textm,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: .5 * heightm,
              ),
              Text(
                'Your password has been reset successfully',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 1.8 * textm,
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
                  color: Colors.grey[300],
                ),
                child: MaterialButton(
                  disabledColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.fromLTRB(
                      3 * widthm, 3 * widthm, 3 * widthm, 3 * widthm),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Login(),
                            type: PageTransitionType.rightToLeftWithFade));
                  },
                  child: Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
