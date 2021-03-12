
import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/divider_widget.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/model/messages_model.dart';
import 'package:voiceit/screen/main_module/messages/send_to_screen.dart';
import 'package:voiceit/screen/main_module/messages/team_screen.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<MessagesModel> messagesModels = new List<MessagesModel>();

  @override
  void initState() {
    super.initState();
    messagesModels.add(new MessagesModel(Color(0xFF3A86FF), "Team røLAN",
        "New voice", AppConstants.img_round, Color(0xFF00BE6E), "1h"));
    messagesModels.add(new MessagesModel(Color(0xFFFF006E), "Gunnar",
        "New voice", AppConstants.img_round, Color(0xFF00BE6E), "2h"));
    messagesModels.add(new MessagesModel(Color(0xFFFB5607), "Odd", "Sent",
        AppConstants.img_sent, Color(0xFF3A86FF), "4h"));
    messagesModels.add(new MessagesModel(Color(0xFFFFBE0B), "Adrian", "Played",
        AppConstants.img_played, Color(0xFF3A86FF), "5h"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
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
                          Container(
                            height: 37,
                            width: 37,
                            margin: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                color: AppConstants.clrAddFriends,
                                shape: BoxShape.circle),
                            alignment: Alignment.center,
                            child: Image.asset(AppConstants.img_add_friends,
                                height: 16),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SendToScreen()));
                              },
                              child: TextWidget(AppConstants.str_addFriends,
                                  fontWeight: FontWeight.w400,
                                  color: AppConstants.clrBlack,
                                  fontSize: AppConstants.size_medium_large),
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                  DividerWidget(
                      height: 1, width: MediaQuery.of(context).size.width),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  itemCount: messagesModels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                       onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>TeamScreen()));
                       },
                      child: Container(
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
                                    Container(
                                      height: 48,
                                      width: 48,
                                      margin:
                                          EdgeInsets.only(left: 16, right: 16),
                                      decoration: BoxDecoration(
                                          color: messagesModels[index].roundColor,
                                          shape: BoxShape.circle),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(messagesModels[index].title,
                                              fontWeight: FontWeight.w700,
                                              color: AppConstants.clrBlack,
                                              fontSize: AppConstants.size_large),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(right: 5),
                                                child: Image.asset(
                                                  messagesModels[index].image,
                                                  height: 12,
                                                  color: messagesModels[index]
                                                      .textColor,
                                                ),
                                              ),
                                              TextWidget(
                                                  messagesModels[index].voices,
                                                  fontWeight: FontWeight.w400,
                                                  color: messagesModels[index]
                                                      .textColor,
                                                  fontSize: AppConstants
                                                      .size_medium_large),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Container(
                                                  height: 4,
                                                  width: 4,
                                                  decoration: BoxDecoration(
                                                      color: AppConstants
                                                          .clrFollowers,
                                                      shape: BoxShape.circle),
                                                ),
                                              ),
                                              TextWidget(
                                                  messagesModels[index].hour,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppConstants.clrFollowers,
                                                  fontSize: AppConstants
                                                      .size_medium_large)
                                            ],
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
                      ),
                    );
                  }),
              flex: 1,
            ),
            Container(
              margin: EdgeInsets.only(top: 31, bottom: 31),
              child: TextWidget(AppConstants.str_clickHere,
                  fontWeight: FontWeight.w400,
                  color: AppConstants.clrClickHere,
                  fontSize: AppConstants.size_large),
            )
          ],
        ),
      ),
    );
  }
}
