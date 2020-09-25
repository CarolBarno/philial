import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/profile_data.dart';
import 'package:philial/view/home/transactions.dart';
import 'package:philial/view/home/activate_package.dart';
import 'package:philial/view/home/profile.dart';
import 'package:philial/view/home/referrals.dart';
import 'package:philial/view/home/withdraw.dart';
import 'package:philial/view/login_register/login.dart';

drawer(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return Container(
    width: MediaQuery.of(context).size.width * .7,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildDrawerHeader(context),
          profile(context),
          activatePackage(context),
          makeWithdrawal(context),
          transactions(context),
          referrals(context),
          logout(context),
        ],
      ),
    ),
  );
}

DrawerHeader buildDrawerHeader(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: Colors.grey[100],
    ),
    child: Column(
      children: <Widget>[
        SizedBox(height: size.setHeight(30)),
        CircleAvatar(
          backgroundColor: defaultBlue,
          radius: size.setWidth(80),
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: size.setWidth(120),
          ),
        ),
        SizedBox(height: size.setHeight(20)),
        Text(
          '$name',
          style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
              fontSize: size.setSp(24),
              fontWeight: FontWeight.w800),
        ),
        Text(
          '$phone',
          style: TextStyle(
            color: defaultBlue,
            fontFamily: 'OpenSans',
            fontSize: size.setSp(24),
          ),
        ),
      ],
    ),
  );
}

Widget profile(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return ListTile(
      dense: true,
      title: Row(
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: size.setWidth(50),
          ),
          SizedBox(
            width: size.setWidth(16),
          ),
          Text(
            'My Profile',
            style: TextStyle(fontSize: size.setSp(24)),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: Profile(), type: PageTransitionType.rightToLeft));
      });
}

Widget activatePackage(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return ListTile(
      dense: true,
      title: Row(
        children: <Widget>[
          Icon(
            Icons.receipt,
            size: size.setWidth(50),
          ),
          SizedBox(
            width: size.setWidth(16),
          ),
          Text(
            'Activate Package',
            style: TextStyle(fontSize: size.setSp(24)),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: ActivatePackage(), type: PageTransitionType.rightToLeft));
      });
}

Widget makeWithdrawal(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return ListTile(
      dense: true,
      title: Row(
        children: <Widget>[
          Icon(
            Icons.call_to_action,
            size: size.setWidth(50),
          ),
          SizedBox(
            width: size.setWidth(16),
          ),
          Text(
            'Make Withdrawal',
            style: TextStyle(fontSize: size.setSp(24)),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: Withdraw(), type: PageTransitionType.rightToLeft));
      });
}

Widget logout(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return ListTile(
      dense: true,
      title: Row(
        children: <Widget>[
          Icon(
            Icons.exit_to_app,
            size: size.setWidth(50),
          ),
          SizedBox(
            width: size.setWidth(16),
          ),
          Text(
            'Logout',
            style: TextStyle(fontSize: size.setSp(24)),
          ),
        ],
      ),
      onTap: () async {
            Navigator.popUntil(context, ModalRoute.withName('/login'));
      });
}

Widget referrals(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return ListTile(
      dense: true,
      title: Row(
        children: <Widget>[
          Icon(
            Icons.group,
            size: size.setWidth(50),
          ),
          SizedBox(
            width: size.setWidth(16),
          ),
          Text(
            'Referrals',
            style: TextStyle(fontSize: size.setSp(24)),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: MyReferrals(), type:PageTransitionType.rightToLeft));
      });
}

Widget transactions(BuildContext context) {
  ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
  var size = ScreenUtil();
  return ListTile(
      dense: true,
      title: Row(
        children: <Widget>[
          Icon(
            Icons.credit_card,
            size: size.setWidth(50),
          ),
          SizedBox(
            width: size.setWidth(16),
          ),
          Text(
            'Transactions',
            style: TextStyle(fontSize: size.setSp(24)),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: Transactions(), type:PageTransitionType.rightToLeft));
      });
}
