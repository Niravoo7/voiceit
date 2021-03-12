import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/button_widget.dart';
import 'package:voiceit/custom_widget/common_appbar.dart';
import 'package:voiceit/custom_widget/divider_widget.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/model/messages_send_to_model.dart';
import 'package:voiceit/screen/main_module/profile/create_profile_screen.dart';

import 'new_post_screen.dart';

class SendToScreen extends StatefulWidget {
  @override
  _SendToScreenState createState() => _SendToScreenState();
}

class _SendToScreenState extends State<SendToScreen> {
  List<SendToModel> sendToModel = new List<SendToModel>();

  @override
  void initState() {
    super.initState();
    sendToModel.add(new SendToModel(
        Color(0xFF3A86FF), "Team røLAN", "Group message", true));
    sendToModel.add(new SendToModel(
        Color(0xFFFF006E), "Gunnar", "Personal message", false));
    sendToModel.add(
        new SendToModel(Color(0xFFFB5607), "Odd", "Personal message", false));
    sendToModel.add(new SendToModel(
        Color(0xFFFFBE0B), "Adrian", "Personal message", false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context, AppConstants.str_sendTo),
      backgroundColor: AppConstants.clrScreenBG,
      body: Container(
        child: Stack(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: sendToModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 81,
                    color: AppConstants.clrWhite,
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            height: 80,
                            margin: EdgeInsets.only(right: 16),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Colors.blue),
                                    child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: AppConstants.clrTabProfile,
                                      value: sendToModel[index].isCheck,
                                      onChanged: (bool value) {
                                        setState(() {
                                          sendToModel[index].isCheck = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 48,
                                  width: 48,
                                  margin: EdgeInsets.only(left: 16, right: 16),
                                  decoration: BoxDecoration(
                                      color: sendToModel[index].color,
                                      shape: BoxShape.circle),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(sendToModel[index].name,
                                          fontWeight: FontWeight.w400,
                                          color: AppConstants.clrBlack,
                                          fontSize: AppConstants.size_large),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: TextWidget(
                                            sendToModel[index].followers,
                                            fontWeight: FontWeight.w400,
                                            color: AppConstants.clrFollowers,
                                            fontSize:
                                                AppConstants.size_medium_large),
                                      )
                                    ],
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        DividerWidget(
                            height: 1,
                            width: MediaQuery.of(context).size.width),
                      ],
                    ),
                  );
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: ButtonWidget(context, AppConstants.str_send, () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>NewPostScreen()));
                    },
                        AppConstants.clrTabCreate, AppConstants.img_union)),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: ButtonWidget(context, AppConstants.str_shae, () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateProfileScreen()));
                    },
                        AppConstants.clrBtnBG, AppConstants.img_share))
              ],
            )
          ],
        ),
      ),
    );
  }
}
