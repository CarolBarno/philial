import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/packages_api.dart';
import 'package:philial/res/apis/register_api.dart';
import 'package:philial/view/home/home.dart';

Future _futurePackage;

class ActivatePackage extends StatefulWidget {
  @override
  _ActivatePackageState createState() => _ActivatePackageState();
}

class _ActivatePackageState extends State<ActivatePackage> {
  bool _isLoading = false;

  @override
  void initState() {
    _futurePackage = fetchPackages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: defaultBlue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 8 * widthm,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Activate Package',
            style: TextStyle(
                fontSize: 2.3 * textm,
                color: Colors.white,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(
              2 * widthm, 3 * widthm, 2 * widthm, 0),
          child: Column(
            children: [
              Expanded(
                child: packageFunction(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget packageFunction(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();

    return FutureBuilder<List<Package>>(
      future: _futurePackage,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data.length == 0) {
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
                'No packages found',
                style: TextStyle(
                  fontSize: size.setSp(24),
                  color: Colors.grey[800],
                ),
              )
            ],
          ));
        } else if (snapshot.hasData) {
          List<Package> data = snapshot.data;
          return packageListView(context, data);
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
                '${snapshot.error}',
//            'Failed to load items',
            style: TextStyle(
              fontSize: size.setSp(24),
              color: Colors.grey[800],
            ),
          ));
        }
        return spinkitBlue;
      },
    );
  }

  Widget packageListView(BuildContext context, data) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    return ListView.builder(
      shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return packageCard(
              context,
              data[index].packageName,
              data[index].level1Bonus,
              data[index].level2Bonus,
              data[index].level3Bonus,
              data[index].regFee,
              data[index].minOperatingBal,
              data[index].minOperatingPeriod,
              data[index].monthlySubscription,
              data[index].packageId,
          _isLoading);
        });
  }

  Widget packageCard(
    BuildContext context,
    String packageName,
    String level1Bonus,
    String level2Bonus,
    String level3Bonus,
    String regFee,
    String minOperatingBal,
    String minOperatingPeriod,
    String monthlySubscription,
    String packageId,
      bool _isLoading
  ) {
    ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
    var size = ScreenUtil();
    return Container(
      height: 43 * heightm,
      child: Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(3 * widthm, size.setWidth(20),
              size.setWidth(10), size.setWidth(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('$packageName Package',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 2.2 * textm,
                ),),
                SizedBox(height: 1 * heightm),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('Level 1 Bonus',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400
                        ),)),
                    Expanded(
                      flex: 1,
                      child: Text('Ksh. $level1Bonus',
                        style: TextStyle(
                            fontSize: 2 * textm,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600
                        ),),
                    )
                  ],
                ),
                SizedBox(height: 1 * heightm),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('Level 2 Bonus',
                            style: TextStyle(
                                fontSize: 1.8 * textm,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400
                            )),),
                    Expanded(
                      flex: 1,
                      child: Text('Ksh. $level2Bonus',
                          style: TextStyle(
                              fontSize: 2 * textm,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600
                          )),
                    )
                  ],
                ),
                SizedBox(height: 1 * heightm),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Level 3 Bonus',
                          style: TextStyle(
                              fontSize: 1.8 * textm,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400
                          )),),
                    Expanded(
                      flex: 1,
                      child: Text('Ksh. $level3Bonus',
                          style: TextStyle(
                              fontSize: 2 * textm,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600
                          )),
                    )
                  ],
                ),
                SizedBox(height: 1 * heightm),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text('Registration Fee',
                          style: TextStyle(
                              fontSize: 1.8 * textm,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w400
                          ))),
                    Expanded(
                      flex: 1,
                      child: Text('Ksh. $regFee',
                          style: TextStyle(
                              fontSize: 2 * textm,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600
                          )),
                    )
                  ],
                ),
                SizedBox(height: 1 * heightm),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('Minimum Operating Balance',
                            style: TextStyle(
                                fontSize: 1.8 * textm,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400
                            ))),
                    Expanded(
                      flex: 1,
                      child: Text('Ksh. $minOperatingBal',
                          style: TextStyle(
                              fontSize: 2 * textm,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600
                          )),
                    )
                  ],
                ),
                SizedBox(height: 1 * heightm),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('Minimum Operating Period',
                            style: TextStyle(
                                fontSize: 1.8 * textm,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w400
                            ))),
                    Expanded(
                      flex: 1,
                      child: Text('$minOperatingPeriod years',
                          style: TextStyle(
                              fontSize: 2 * textm,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600
                          )),
                    )
                  ],
                ),
                SizedBox(height: 2 * heightm),
                Text(
                  'Ksh. $monthlySubscription / Month',
                  style: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.w600,
                    fontSize: 2.3 * textm
                  ),
                ),
                SizedBox(height: 3 * heightm),
                Container(
                  width: 40 * widthm,
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
                    onPressed: () async {
                      await activatePackage(packageId, _isLoading);
                    },
                    child: _isLoading
                        ? spinKit
                        : Text(
                            'Activate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 2 * textm,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  activatePackage(String packageId, bool isLoading) async {
    print('$isLoading');
    setState(() {
      isLoading = true;
    });
print('pppppppppppppp  $packageId');
    print('$isLoading');
    var data = {"package_id": packageId};

    print(' data $data');

    var res = await postData(data, 'user-packages');
    var body = json.decode(res.body);

    print('Add package response $body');

    if (res.statusCode == 200) {
      showToast(context, 'Package added successfully');

      Navigator.pushReplacement(context,
          PageTransition(child: Home(), type: PageTransitionType.leftToRight));
    } else if(res.statusCode == 409) {
      showToast(context, 'You already have an active package');
    }
    else {
      showToast(context, 'Unable to activate package');
    }

    setState(() {
      isLoading = false;
    });
  }
}
