import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/profile_data.dart';
import 'package:philial/view/home/drawer.dart';
import 'package:philial/view/home/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: defaultBlue,
//          leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back,
//              size: 6 * widthm,
//              color: Colors.grey[500],
//            ),
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
          title: Text(
            'Philial',
            style: TextStyle(
                fontSize: 2.3 * textm,
                color: Colors.white,
                fontWeight: FontWeight.w800),
          ),
//          actions: [
//          IconButton(
//            icon: Icon(
//              Icons.account_circle,
//              size: 7 * widthm,
//              color: Colors.white70,
//            ),
//            onPressed: () {
//              Navigator.push(
//                  context,
//                  PageTransition(
//                      type: PageTransitionType.fade,
//                      child: Profile()));
//            },
//          ),
//          ],
        ),
        drawer: drawer(context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
            color: Colors.grey[100],
            child: Column(
              children: <Widget>[
                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Number of Referrals',
                                      style: TextStyle(
                                          fontSize: 2 * textm,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 2.5 * heightm,
                                    ),
                                    Text(
                                      '21',
                                      style: TextStyle(
                                          fontSize: 2.5 * textm,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/referral.png",
                                  color: Colors.red[900],
                                  height: 8 * heightm,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2 * heightm,
                ),
                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Account Balance',
                                      style: TextStyle(
                                          fontSize: 2 * textm,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 2.5 * heightm,
                                    ),
                                    Text(
                                      'Ksh. 44,600',
                                      style: TextStyle(
                                          fontSize: 2.5 * textm,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/account-balance.png",
                                  color: Colors.green,
                                  height: 6 * heightm,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2 * heightm,
                ),
                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Next Due Payment Date',
                                      style: TextStyle(
                                          fontSize: 2 * textm,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 2.5 * heightm,
                                    ),
                                    Text(
                                      '2020-09-22',
                                      style: TextStyle(
                                          fontSize: 2.5 * textm,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/timetable.png",
                                  color: Colors.black,
                                  height: 6 * heightm,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2 * heightm,
                ),
                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Next Due Payment Amount',
                                      style: TextStyle(
                                          fontSize: 2 * textm,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 2.5 * heightm,
                                    ),
                                    Text(
                                      'Ksh. 3,000',
                                      style: TextStyle(
                                          fontSize: 2.5 * textm,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/dollar-currency-symbol.png",
                                  color: defaultBlue,
                                  height: 6 * heightm,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2 * heightm,
                ),
                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Active Package',
                                      style: TextStyle(
                                          fontSize: 2 * textm,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 2.5 * heightm,
                                    ),
                                    Text(
                                      'Silver',
                                      style: TextStyle(
                                          fontSize: 2.5 * textm,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/dollar-currency-symbol.png",
                                  color: Colors.black,
                                  height: 6 * heightm,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
}
