import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/referrals_api.dart';

Future _futuremyreferrals1;
Future _futuremyreferrals2;
Future _futuremyreferrals3;

class MyReferrals extends StatefulWidget {
  @override
  _MyReferralsState createState() => _MyReferralsState();
}

class _MyReferralsState extends State<MyReferrals> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futuremyreferrals1 = fetchReferrals('level_one_data');
    _futuremyreferrals2 = fetchReferrals('level_two_data');
    _futuremyreferrals3 = fetchReferrals('level_three_data');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: defaultBlue,
            bottom: TabBar(
              indicatorColor: defaultBlue,
              indicatorWeight: 3,
              tabs: [
                //all vehicles
                Tab(
                  child: Text(
                    'Level 1',
                    style: TextStyle(
                      fontSize: size.setSp(24),
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                //individual
                Tab(
                  child: Text(
                    'Level 2',
                    style: TextStyle(
                      fontSize: size.setSp(24),
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                //assigned
                Tab(
                  child: Text(
                    'Level 3',
                    style: TextStyle(
                      fontSize: size.setSp(24),
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(size.setWidth(5), 0, 0, 0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Colors.white, size: size.setWidth(40)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'My Referrals',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.setSp(26),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: defaultBlue,
                          size: size.setWidth(60),
                        ),
                        onPressed: () {
//                          Navigator.pushReplacement(context,
//                              BouncyPageRoute(widget: MemberVehicleDetails()));
                        }),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              //level 1
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.setHeight(20)),
                        myReferrals1Function(context),
                      ],
                    ),
                  ),
                ],
              ),

              ///Individual vehicles here
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.setHeight(20)),
                        myReferrals2Function(context),
                      ],
                    ),
                  ),
                ],
              ),

              //level 3
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.setHeight(20)),
                        myReferrals3Function(context),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myReferrals1Function(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    //try {
    return FutureBuilder<List<ReferralsData>>(
      future: _futuremyreferrals1,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.length == 0) {
//          // print('data length is there${snapshot.data.length}>>>>>>>>>>>>>>>>>>>>>');

          return Center(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: size.setHeight(20),
              ),
              SizedBox(
                height: size.setHeight(20),
              ),
              Text(
                'No referral found',
                style: TextStyle(
                  fontSize: size.setSp(24),
                  color: Colors.grey[800],
                ),
              )
            ],
          ));
        } else if (snapshot.hasData) {
//          print('data length is zer>>>>>>>>>>>>>>>>>>>>>');
          List<ReferralsData> data = snapshot.data;
          return myReferralsListView(context, data);
        } else if (snapshot.hasError) {
//          print('errorrrr>>>>>>>>>>>>>>>>>>>>>"${snapshot.data}"');
          return Center(
              child: Text("${snapshot.error}  ${snapshot.data.length}"));
        }
        return spinkitBlue;
      },
    );
  }

  Widget myReferrals2Function(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    //try {
    return FutureBuilder<List<ReferralsData>>(
      future: _futuremyreferrals2,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.length == 0) {
//          // print('data length is there${snapshot.data.length}>>>>>>>>>>>>>>>>>>>>>');

          return Center(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: size.setHeight(20),
              ),
              SizedBox(
                height: size.setHeight(20),
              ),
              Text(
                'No referral found',
                style: TextStyle(
                  fontSize: size.setSp(24),
                  color: Colors.grey[800],
                ),
              )
            ],
          ));
        } else if (snapshot.hasData) {
//          print('data length is zer>>>>>>>>>>>>>>>>>>>>>');
          List<ReferralsData> data = snapshot.data;
          return myReferralsListView(context, data);
        } else if (snapshot.hasError) {
//          print('errorrrr>>>>>>>>>>>>>>>>>>>>>"${snapshot.data}"');
          return Center(
              child: Text("${snapshot.error}  ${snapshot.data.length}"));
        }
        return spinkitBlue;
      },
    );
  }

  Widget myReferrals3Function(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    //try {
    return FutureBuilder<List<ReferralsData>>(
      future: _futuremyreferrals3,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.length == 0) {
//          // print('data length is there${snapshot.data.length}>>>>>>>>>>>>>>>>>>>>>');

          return Center(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: size.setHeight(20),
              ),
              SizedBox(
                height: size.setHeight(20),
              ),
              Text(
                'No referral found',
                style: TextStyle(
                  fontSize: size.setSp(24),
                  color: Colors.grey[800],
                ),
              )
            ],
          ));
        } else if (snapshot.hasData) {
//          print('data length is zer>>>>>>>>>>>>>>>>>>>>>');
          List<ReferralsData> data = snapshot.data;
          return myReferralsListView(context, data);
        } else if (snapshot.hasError) {
//          print('errorrrr>>>>>>>>>>>>>>>>>>>>>"${snapshot.data}"');
          return Center(
              child: Text("${snapshot.error}  ${snapshot.data.length}"));
        }
        return spinkitBlue;
      },
    );
  }

  Widget myReferralsListView(BuildContext context, data) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    return Flexible(
      child: ListView.builder(
          itemExtent: size.setWidth(160),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return referralCard(
              context,
              data[index].referralDate,
              data[index].refereeName,
              data[index].refereePhone,
            );
          }),
    );
  }

  Widget referralCard(
      BuildContext context, String date, String name, String phone) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    return InkWell(
      onTap: () {
//        Navigator.push(
//            context,
//            PageTransition(
//                child: VehicleDetailsMember(
//                    regNo, vType, vcolor, vmodel, vCategory),
//                type: PageTransitionType.rightToLeft));
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(0,0,0,size.setWidth(5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        elevation: 0,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(size.setWidth(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 5),
                  Text(
                    name.toUpperCase(),
                    style: TextStyle(
                        fontSize: size.setSp(26),
                        color: defaultBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: size.setWidth(10)),
                  Text(
                    phone,
                    style: TextStyle(
                        fontSize: size.setSp(24),
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: size.setWidth(10)),
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: size.setSp(24),
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
