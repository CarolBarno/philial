import 'dart:io';

import 'package:flutter/material.dart';
import 'package:philial/res/size_config.dart';
import 'package:philial/view/login_register/login.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = new MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sacco App',
            theme: ThemeData(primaryColor: Colors.blue, fontFamily: 'OpenSans'),
            initialRoute: '/login',
            routes: <String, WidgetBuilder>{
              '/login': (context) => Login(),
            });
      });
    });
  }
}