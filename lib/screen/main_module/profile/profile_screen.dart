import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.clrTabCreate,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppConstants.img_my_profile_bg),
                  fit: BoxFit.fill)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppConstants.img_my_profile_bg1),
                    fit: BoxFit.fill)),
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(AppConstants.str_dagensTanker,
                    fontWeight: FontWeight.w700,
                    color: AppConstants.clrWhite,
                    fontSize: AppConstants.size_double_extra_large),
                SizedBox(height: 12),
                TextWidget(AppConstants.str_hashTages,
                    fontWeight: FontWeight.w700,
                    color: AppConstants.clrWhite,
                    fontSize: AppConstants.size_large)
              ],
            ),
          )),
    );
  }
}
