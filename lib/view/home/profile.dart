import 'package:flutter/material.dart';
import 'package:philial/res/apis/constant.dart';

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
            'Profile',
            style: TextStyle(
                fontSize: 2.3 * textm,
                color: Colors.blue,
                fontWeight: FontWeight.w800),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(
              3 * widthm, 3 * widthm, 1 * widthm, 1 * widthm),
          color: Colors.grey[100],
          child: Column(
            children: [
              Container(
                height: 20 * heightm,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Carol Barno',
                                    style: TextStyle(
                                        fontSize: 2.3 * textm,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 1 * heightm,
                                  ),
                                  Text(
                                    'carol@gmail.com',
                                    style: TextStyle(
                                        fontSize: 2.1 * textm,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 0.4 * heightm,
                                  ),
                                  Text(
                                    '07123455678',
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
                                        borderRadius: BorderRadius.all(Radius.circular(1 * widthm))
                                    ),

                                    child:  Center(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
