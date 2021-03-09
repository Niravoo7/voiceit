import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/screen/main_module/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppConstants.clrWhite,
      title: AppConstants.str_app_name,
      theme: ThemeData(
          primaryColor: AppConstants.clrWhite,
          primaryColorDark: AppConstants.clrWhite,
          accentColor: AppConstants.clrBlack,
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppConstants.clrWhite,
          fontFamily: AppConstants.fontRoboto),
      home: MainScreen(),
    );
  }
}
