import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/register_api.dart';
import 'package:philial/view/home/home.dart';

class ActivatePackage extends StatefulWidget {
  @override
  _ActivatePackageState createState() => _ActivatePackageState();
}

class _ActivatePackageState extends State<ActivatePackage> {

  GlobalKey<FormState> _vformKey = GlobalKey<FormState>();
  String selectedPackage;

  bool _isLoading = false;
  List data = List();
  int pageNo = 0;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    getPackage();
  }

  Future<String> getPackage() async {
    final response = await getData('package?pageNo=$pageNo&pageSize=$pageSize');
    var content = json.decode(response.body);
    var resBody2 = content['content'];
    print('package  $response');
    print('package  $content');
    print('package  $resBody2');
    setState(() {
      data = resBody2;
    });
    return "Success";
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
              3 * widthm, 8 * widthm, 3 * widthm, 3 * widthm),
          child: Column(
            children: [
              Form(
                key: _vformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Package Type',
                      style: TextStyle(fontSize: 2 * textm,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600]),
                    ),
                    SizedBox(height: 2 * heightm),
                    Container(
                        alignment: Alignment.centerRight,
                        width: 100 * widthm,
                        height: 7 * heightm,
                        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
                        decoration: ShapeDecoration(
                    color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                        child: _normalDown()),

                  ],
                ),
              ),
              SizedBox(height: 5 * heightm),
              Container(
                width: 70 * widthm,
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
                    await activatePackage();
                  },
                  child: _isLoading ?
                  spinKit : Text(
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
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline _normalDown() => DropdownButtonHideUnderline(
        child: DropdownButton(
          iconEnabledColor: Colors.blue,
          iconDisabledColor: Colors.red,
          isExpanded: true,
          hint: Text(
            "Select",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          value: selectedPackage,
          isDense: true,
          onChanged: (newValue) {
            setState(() {
              selectedPackage = newValue;
            });
          },
          items: data.map((map) {
            return DropdownMenuItem(
              value: map['package_id'].toString(),
              child: Text(map['package_name'],
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            );
          }).toList(),
        ),
      );


  activatePackage() async {

    _vformKey.currentState.save();

    setState(() {
      _isLoading = true;
    });

    var data = {
      "package_id": selectedPackage
    };

    print(' data $data');

    var res = await postData(data, 'user-packages');
    var body = json.decode(res.body);

    print('Add package response $body');

    if (res.statusCode == 200) {
      showToast(context, 'Package added successfully');

      Navigator.pushReplacement(
          context,
          PageTransition(
              child: Home(), type: PageTransitionType.leftToRight));
    } else {
      showToast(context, 'Unable to activate package');
    }


    setState(() {
      _isLoading = false;
    });
  }

}
