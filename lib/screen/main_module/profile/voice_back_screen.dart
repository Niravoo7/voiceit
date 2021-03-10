import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/flexible_widget.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';

class VoiceBackScreen extends StatefulWidget {
  @override
  _VoiceBackScreenState createState() => _VoiceBackScreenState();
}

class _VoiceBackScreenState extends State<VoiceBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.clrTabProfile,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      TextWidget(AppConstants.str_messageFromGunnar,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.clrWhite,
                          fontSize: AppConstants.size_extra_large),
                      SizedBox(height: 8),
                      TextWidget(AppConstants.str_team,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.clrWhite,
                          fontSize: AppConstants.size_medium)
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        color: AppConstants.clrWhite,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),

            ),
            FlexibleWidget(1),
            Flexible(
                flex: 1,
                child:    Container(
                  color: AppConstants.clrTransparent,
                  height: 138,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    AppConstants.img_xmlid,
                  ),
                ),),
            FlexibleWidget(1),
            Container(
              height: 95,
              width: 95,
             // margin: EdgeInsets.only(bottom: 28),
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppConstants.clrTabNotifications,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 30,top: 15),
              child: TextWidget(AppConstants.str_voiceBack,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.clrWhite,
                  fontSize: AppConstants.size_medium_large),
            ),

          ],
        ));
  }
}
