import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:philial/res/apis/constant.dart';
import 'package:philial/res/apis/profile_data.dart';
import 'package:philial/view/login_register/change_password.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'My Profile',
            style: TextStyle(
                fontSize: 2.3 * textm,
                color: defaultBlue,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 1))
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: 100 * heightm,
          padding: EdgeInsets.fromLTRB(
              3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$name',
                                style: TextStyle(
                                    fontSize: 2.3 * textm,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 1 * heightm,
                              ),
                              Text(
                                '$email',
                                style: TextStyle(
                                    fontSize: 2.1 * textm,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 0.4 * heightm,
                              ),
                              Text(
                                '+$phone',
                                style: TextStyle(
                                    fontSize: 2.1 * textm,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 0.6 * heightm,
                              ),
                              Container(
                                height: 4 * heightm,
                                width: 20 * widthm,
//                                    padding: EdgeInsets.all(2 * widthm),
                                decoration: BoxDecoration(
//                                        color: Colors.grey[300],
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1 * widthm))),

                                child: Center(
                                  child: Text(
                                    'Active',
                                    style: TextStyle(
                                      fontSize: 2.3 * textm,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3 * heightm,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: ChangePassword(),
                                          type:
                                              PageTransitionType.rightToLeft));
                                },
                                child: Text(
                                  'Change Password',
                                  style: TextStyle(
                                    fontSize: 2.2 * textm,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                          Icon(
                            Icons.account_circle,
                            size: 20 * widthm,
                            color: Colors.grey[800],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
