import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/view/login_register/login.dart';

class AccountPayment extends StatefulWidget {
  @override
  _AccountPaymentState createState() => _AccountPaymentState();
}

class _AccountPaymentState extends State<AccountPayment> {
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
//            leading: IconButton(
//              icon: Icon(
//                Icons.arrow_back,
//                size: 6 * widthm,
//                color: Colors.grey[500],
//              ),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
            title: Text(
              'Account Activation Guide',
              style: TextStyle(
                  fontSize: 2.3 * textm,
                  color: defaultBlue,
                  fontWeight: FontWeight.w800),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Please activate your account by paying the required amount.'),
                  SizedBox(
                    height: 1 * heightm,
                  ),
                  Text(
                    'Complete Activation Guide',
                    style: TextStyle(
                      fontSize: 2 * textm,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 3 * heightm,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                      ),
                      Flexible(
                          child: Text(
                            'Go to Safaricom SIM Tool Kit, select M-PESA menu, select "Lipa na M-PESA"',
                            style: TextStyle(
                              fontSize: 1.8 * textm,
                            ),)),
                    ],
                  ),
                  SizedBox(
                    height: 1 * heightm,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                      ),
                      Flexible(child: Text('Select "Pay Bill"',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),)),
                    ],
                  ),
                  SizedBox(
                    height: 1 * heightm,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                      ),
                      Flexible(
                        child: Text(
                          'Select "Enter Business no.", Enter Philial Lipa na M-PESA PayBill Number 4029361 and press "OK"',
                          style: TextStyle(
                            fontSize: 1.8 * textm,
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1 * heightm,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                      ),
                      Flexible(
                        child: Text(
                          'Select "Enter Account no.", Enter your Phone Number the press "OK"',
                          style: TextStyle(
                            fontSize: 1.8 * textm,),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1 * heightm,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                      ),
                      Flexible(
                        child: Text(
                          '"Enter Amount", exact activation amount for selected package',
                          style: TextStyle(
                            fontSize: 1.8 * textm,
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1 * heightm,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                      ),
                      Flexible(child: Text('Enter your M-PESA PIN and press "OK"',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),)),
                    ],
                  ),
                  SizedBox(
                    height: 1.2 * heightm,
                  ),
                  Text(
                    'You will receive a confirmation SMS from M-PESA. Then click "COMPLETE" button below',
                    style: TextStyle(
                      fontSize: 1.9 * textm,
                    ),),
                  SizedBox(
                    height: 4 * heightm,
                  ),
                  SizedBox(
                    width: 33 * widthm,
                    height: 6 * heightm,
                    child: FlatButton(
                      color: defaultBlue,
                      disabledColor: Colors.grey,
                      onPressed: () async {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Login(), type: PageTransitionType.leftToRight));
                      },
                      child: Text(
                        'Complete',
                        style: TextStyle(
                          fontSize: size.setSp(24),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
