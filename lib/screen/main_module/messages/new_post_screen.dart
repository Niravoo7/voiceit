import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/button_widget.dart';
import 'package:voiceit/custom_widget/common_appbar.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/screen/main_module/messages/add_effect_screen.dart';

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context, AppConstants.str_newPost),
      backgroundColor: AppConstants.clrScreenBG,
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextWidget(AppConstants.str_postTitle,
                    fontWeight: FontWeight.w400,
                    color: AppConstants.clrGreyTex,
                    fontSize: AppConstants.size_large),
              ),
              Container(
                color: AppConstants.clrTabCreate,
                height: 138,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  AppConstants.img_xmlid,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextWidget(AppConstants.str_stolPower,
                    fontWeight: FontWeight.normal,
                    color: AppConstants.clrBlack,
                    fontSize: AppConstants.size_large),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: AppConstants.clrScreenBG,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: ButtonWidget(context, AppConstants.str_publishOnProfile, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEffectScreen()));
                }, AppConstants.clrTabProfile, AppConstants.img_union)),
          ),
        ],
      ),

    );
  }
}
