import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/home_data_api.dart';
import 'package:philial/res/apis/profile_data.dart';
import 'package:philial/view/home/drawer.dart';
import 'package:philial/view/home/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  getProfileData() async {
    try {
      localStorage = await SharedPreferences.getInstance();

      setState(() {
        name = localStorage.getString('name');
        phone = localStorage.getString('phone');
        email = localStorage.getString('email');
      });

    } catch (e) {
    }
  }

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
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    numberOfReferrals == null ? Text('') :
                                    Text(
                                      '$numberOfReferrals',
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
                            child: Icon(
                              Icons.group,
                              size:16*widthm,

                              color: Colors.red[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    accountBalance == null ? Text('') :
                                    Text(
                                      'Ksh. $accountBalance',
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
                            child: Icon(
                              Icons.monetization_on,
                              size:16*widthm,

                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    nextRepaymentDate == null ? Text(''):
                                    Text(
                                      '$nextRepaymentDate',
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
                            child: Icon(
                              Icons.calendar_today,
                              size:14*widthm,

                              color: defaultBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    nextDueAmount == null ? Text('') :
                                    Text(
                                      'Ksh. $nextDueAmount',
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
                            child: Icon(
                              Icons.attach_money,
                              size:16*widthm,

                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 16 * heightm,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    activePackage == null ? Text('') :
                                    Text(
                                      '$activePackage',
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
                            child: Icon(
                              Icons.wb_incandescent,
                              size:14*widthm,

                              color: Colors.deepOrangeAccent,
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
