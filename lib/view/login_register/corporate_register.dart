import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/register_api.dart';
import 'package:philial/view/login_register/login.dart';

class CorporateRegister extends StatefulWidget {
  @override
  _CorporateRegisterState createState() => _CorporateRegisterState();
}

class _CorporateRegisterState extends State<CorporateRegister> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  DateTime _dob = DateTime.now();
  String membershipType;
  String name;
  String phone;
  String email;
  String dob;
  String gender;
  String maritalStatus;
  String idNumber;
  String county;
  String constituency;
  String ward;
  String residence;
  String religion;
  String referredBy;
  String password;
  String confirmPass;
  String packageId;
  String registrationNumber;
  String email1;
  String name1;
  String phone1;
  String email2;
  String name2;
  String phone2;
  String gender2;
  String idNumber2;

  List data = List();

  @override
  void initState() {
    getPackages();
    super.initState();
  }

  Future<String> getPackages() async {
    final response = await getPackage('package?pageNo=0&pageSize=10');
    var body = json.decode(response.body);
    var resBody2 = body['content'];
    setState(() {
      data = resBody2;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
    var size = ScreenUtil();

    TextStyle style =
    TextStyle(fontFamily: 'OpenSans', fontSize: size.setSp(24));

    Widget buildFullName() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            name = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Full name is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildFullName1() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            name1 = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Full name is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildFullName2() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            name2 = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Full name is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildMembershipType() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              iconEnabledColor: defaultBlue,
              iconDisabledColor: Colors.grey,
              isExpanded: true,
              hint: Text(
                "Select",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 1.8 * textm,
                    fontWeight: FontWeight.w500),
              ),
              isDense: true,
              items: ["Individual", "Junior", "Corporate"]
                  .map((filter) => DropdownMenuItem<String>(
                child: Text(
                  filter,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 1.8 * textm,
                      fontWeight: FontWeight.w500),
                ),
                value: filter,
              ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  membershipType = newValue;
                });
              },
              value: membershipType),
        ),
      );
    }

    _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _dob,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        },
      );
      if (picked != null && picked != _dob)
        setState(() {
          dob = DateFormat('yyyy-MM-dd').format(picked);
          _dob = picked;
        });
    }

    Widget buildDob() {
      return GestureDetector(
        onTap: () {
          _selectDate(context);
        },
        child: Container(
          height: 6 * heightm,
          padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
          decoration: ShapeDecoration(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dob == null
                  ? Text(
                "Select",
                style: TextStyle(
                  fontSize: 2 * textm,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                ),
              )
                  : Text("${_dob.toLocal()}".split(' ')[0]),
              Icon(
                Icons.calendar_today,
                color: defaultBlue,
                size: 7 * widthm,
              ),
            ],
          ),
        ),
      );
    }

    Widget buildGender() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              iconEnabledColor: defaultBlue,
              iconDisabledColor: Colors.grey,
              isExpanded: true,
              hint: Text(
                "Select",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 1.8 * textm,
                    fontWeight: FontWeight.w500),
              ),
              isDense: true,
              items: ["Female", "Male", "Others"]
                  .map((filter) => DropdownMenuItem<String>(
                child: Text(
                  filter,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 1.8 * textm,
                      fontWeight: FontWeight.w500),
                ),
                value: filter,
              ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  gender = newValue;
                });
              },
              value: gender),
        ),
      );
    }

    Widget buildGender2() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              iconEnabledColor: defaultBlue,
              iconDisabledColor: Colors.grey,
              isExpanded: true,
              hint: Text(
                "Select",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 1.8 * textm,
                    fontWeight: FontWeight.w500),
              ),
              isDense: true,
              items: ["Female", "Male", "Others"]
                  .map((filter) => DropdownMenuItem<String>(
                child: Text(
                  filter,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 1.8 * textm,
                      fontWeight: FontWeight.w500),
                ),
                value: filter,
              ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  gender2 = newValue;
                });
              },
              value: gender2),
        ),
      );
    }

    Widget buildMaritalStatus() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              iconEnabledColor: defaultBlue,
              iconDisabledColor: Colors.grey,
              isExpanded: true,
              hint: Text(
                "Select",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 1.8 * textm,
                    fontWeight: FontWeight.w500),
              ),
              isDense: true,
              items: ["Single", "Married"]
                  .map((filter) => DropdownMenuItem<String>(
                child: Text(
                  filter,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 1.8 * textm,
                      fontWeight: FontWeight.w500),
                ),
                value: filter,
              ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  maritalStatus = newValue;
                });
              },
              value: maritalStatus),
        ),
      );
    }

    Widget buildPackage() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              iconEnabledColor: defaultBlue,
              iconDisabledColor: Colors.grey,
              isExpanded: true,
              hint: Text(
                "Select",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 1.8 * textm,
                    fontWeight: FontWeight.w500),
              ),
              isDense: true,
              items: data
                  .map((filter) => DropdownMenuItem<String>(
                child: Text(
                  filter['package_name'],
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 1.8 * textm,
                      fontWeight: FontWeight.w500),
                ),
                value: filter['package_id'].toString(),
              ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  packageId = newValue;
                });
              },
              value: packageId),
        ),
      );
    }

    Widget buildEmail() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            email = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildEmail1() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            email1 = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildEmail2() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            email2 = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildCounty() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            county = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'County is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildRegistrationNumber() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            registrationNumber = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'County is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildConstituency() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            constituency = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Constituency is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildWard() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            ward = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Ward is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildResidence() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            residence = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Residence is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildReligion() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            religion = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Religion is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildReferredBy() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            referredBy = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Referred by is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildPassword() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          obscureText: true,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            password = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password is required';
            } else if (value.length < 4) {
              return 'Password must be more than 4 characters';
            }
            return null;
          },
        ),
      );
    }

    Widget buildConfirmPassword() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
          obscureText: true,
//          autocorrect: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            confirmPass = value;
          },
          validator: (String value) {
            if (value != password) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      );
    }

    Widget buildIdNumber() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
//          autocorrect: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            idNumber = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'ID number is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildIdNumber2() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
//          autocorrect: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            idNumber2 = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'ID number is required';
            }
            return null;
          },
        ),
      );
    }



    Widget buildPhone() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
//          autocorrect: true,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            phone = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Phone number is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildPhone1() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
//          autocorrect: true,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            phone1 = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Phone number is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildPhone2() {
      return Container(
        height: 6 * heightm,
        padding: EdgeInsets.fromLTRB(3 * widthm, 0, 3 * widthm, 0),
        decoration: ShapeDecoration(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        child: TextFormField(
//          autocorrect: true,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          onChanged: (value) {
            phone2 = value;
          },
          validator: (String value) {
            if (value.isEmpty) {
              return 'Phone number is required';
            }
            return null;
          },
        ),
      );
    }

    Widget buildJoinButton() {
      return SizedBox(
        width: 88 * widthm,
        child: MaterialButton(
          disabledColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: defaultBlue,
          minWidth: 3 * widthm,
          padding: EdgeInsets.fromLTRB(
              3 * widthm, 3 * widthm, 3 * widthm, 3 * widthm),
          onPressed: isLoading ? null : _handleRegister,
          child: isLoading
              ? spinKit
              : Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 2 * textm,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 6 * widthm,
              color: Colors.grey[500],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Philial',
            style: TextStyle(
                fontSize: 2.3 * textm,
                color: defaultBlue,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(size.setWidth(40), size.setWidth(60),
                size.setWidth(40), size.setWidth(40)),
            child: Column(
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
//                      Text(
//                        'Membership Type',
//                        style: TextStyle(
//                          fontSize: 1.8 * textm,
//                        ),
//                      ),
//                      SizedBox(height: size.setHeight(20)),
//                      buildMembershipType(),
//                      SizedBox(height: size.setHeight(20)),
                      Text('Enter corporate details',
                        style: TextStyle(
                            fontSize: 1.9 * textm,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildFullName(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildPhone(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildEmail(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Registration Number',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildRegistrationNumber(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'County',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildCounty(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Constituency',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildConstituency(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Ward',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildWard(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildResidence(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Package',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildPackage(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Referred By',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildReferredBy(),
                      SizedBox(height: size.setHeight(30)),
                      Text('Enter corporate signatory 1 details',
                        style: TextStyle(
                            fontSize: 1.9 * textm,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 1 Full Name',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildFullName1(),
                      SizedBox(height: size.setHeight(20)),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 1 Email',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildEmail1(),
                      SizedBox(height: size.setHeight(20)),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 1 ID Number',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildIdNumber(),
                      SizedBox(height: size.setHeight(20)),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 1 Phone',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildPhone1(),
                      SizedBox(height: size.setHeight(20)),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 1 Gender',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildGender(),
                      SizedBox(height: size.setHeight(30)),
                      Text('Enter corporate signatory 2 details',
                        style: TextStyle(
                            fontSize: 1.9 * textm,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600
                        ),),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 2 Full Name',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildFullName2(),
                      SizedBox(height: size.setHeight(20)),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 2 Email',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildEmail2(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 2 ID Number',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildIdNumber2(),
                      SizedBox(height: size.setHeight(20)),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 2 Phone',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildPhone2(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Corporate Signatory 2 Gender',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildGender2(),
                      SizedBox(height: size.setHeight(20)),

                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildPassword(),
                      SizedBox(height: size.setHeight(20)),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 1.8 * textm,
                        ),
                      ),
                      SizedBox(height: size.setHeight(20)),
                      buildConfirmPassword(),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.setHeight(100),
                ),
                buildJoinButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleRegister() async {
    if (!formKey.currentState.validate()) {
      showSnack(context);
      return;
    }

    formKey.currentState.save();
    setState(() {
      isLoading = true;
    });

    var data = {
      "constituency": constituency,
      "county": county,
      "email": email,
      "full_name": name,
      "id_number": registrationNumber,
      "membership_type_enum": 'Corporate',
      "otp": true,
      "package_id": packageId,
      "password": password,
      "phone_number": phone,
      "reffered_by": referredBy,
      "residence": residence,
      "user_type_enum": "Subscriber",
      "ward": ward,
      "corporate_signatories_datas": [
        {
          "email": email1,
          "full_name": name1,
          "gender": gender,
          "id_number": idNumber,
          "phone_number": phone1,
        },
        {
          "email": email2,
          "full_name": name2,
          "gender": gender2,
          "id_number": idNumber2,
          "phone_number": phone2,
        }
      ],
    };

    print('data is $data');

    var res = await registerPostData(data, 'users');
    var body = json.decode(res.body);

    print(body);
    var message = body['message'];

    if (res.statusCode == 200) {
      showToast(context, '$message');

      Navigator.push(context,
          PageTransition(type: PageTransitionType.rightToLeft, child: Login()));
//      await requestToken(phone, password).then((onValue) => Navigator.push(
//          context,
//          PageTransition(
//              type: PageTransitionType.rightToLeft, child: Login())));
    } else {
      showToast(context, '$message');
    }

    setState(() {
      isLoading = false;
    });
  }

  showSnack(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1500, allowFontScaling: false);
    var size = ScreenUtil();
    final snackBar = SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
        content: Container(
          height: size.setHeight(80),
          child: Center(
            child: Text(
              'Please correct the above errors!',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
