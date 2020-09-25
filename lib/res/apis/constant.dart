import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:philial/res/size_config.dart';

Color defaultBlue = const Color(0xFF1034a6);

Color bgColor = Colors.grey[300];

var heightm = SizeConfig.heightMultiplier;
var widthm = SizeConfig.widthMultiplier;
var textm = SizeConfig.textMultiplier;

final spinKit = SpinKitThreeBounce(
  color: Colors.white,
  size: 20.0,
);

final spinKitBlack = SpinKitThreeBounce(
  color: Colors.black,
  size: 20.0,
);

final spinKitBlackSmall = SpinKitThreeBounce(
  color: Colors.black,
  size: 10.0,
);

final spinkitBlue = SpinKitThreeBounce(
  color: defaultBlue,
  size: 15.0,
);

///FToast
void showToast(BuildContext context, String text) {
  ScreenUtil.init(context, width: 720, height: 1280, allowFontScaling: false);
  var size = ScreenUtil();
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red[900],
    textColor: Colors.white,
    fontSize: size.setSp(24),
  );
}
