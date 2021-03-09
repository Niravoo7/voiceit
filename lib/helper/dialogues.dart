import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voiceit/helper/constants.dart';

void showAlert(BuildContext context, String strMessage, String strTitle,
    String strButton) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(strTitle),
            content: Text(strMessage),
            actions: <Widget>[
              FlatButton(
                  child: new Text(strButton),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ));
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<bool> checkInternetConnect() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

void onLoading(BuildContext context, String strMessage) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          alignment: Alignment.center,
          height: 100,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(right: 30),
                child: CupertinoActivityIndicator(
                  radius: 30.0,
                ),
              ),
              Flexible(
                child: Text(
                  strMessage,
                  maxLines: 2,
                  style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.clrBlack),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<bool> onWillPops(BuildContext context) {
  return showDialog(
        context: context,
        // ignore: deprecated_member_use
        child: AlertDialog(
          title: Text(AppConstants.str_are_you_sure_you_want_to_exit),
          content: Text(AppConstants.str_exitApp),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(AppConstants.str_no),
            ),
            FlatButton(
              onPressed: () => SystemNavigator.pop(),
              child: Text(AppConstants.str_yes),
            ),
          ],
        ),
      ) ??
      false;
}
