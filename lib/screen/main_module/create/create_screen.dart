import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/flexible_widget.dart';
import 'package:voiceit/helper/constants.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50),
              child: Image.asset(AppConstants.img_main_text_logo, height: 40),
            ),
            FlexibleWidget(1),
            FlexibleWidget(1),
            Container(
              height: 138,
              width: 138,
              margin: EdgeInsets.only(bottom: 28),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppConstants.clrTabCreate,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppConstants.clrWhite, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.clrDarkGrey,
                      blurRadius: 20.0,offset: Offset(10.0, 5.0),
                    )
                  ]),
              child: Image.asset(
                AppConstants.img_main_logo,
                color: AppConstants.clrWhite,
                height: 75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
