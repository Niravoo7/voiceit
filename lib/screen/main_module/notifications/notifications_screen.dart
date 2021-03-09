import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/divider_widget.dart';
import 'package:voiceit/custom_widget/flexible_widget.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/model/notifications_model.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationsModel> notificationsModels = new List<NotificationsModel>();

  @override
  void initState() {
    super.initState();
    notificationsModels.add(new NotificationsModel(
        Color(0xFFFF006E), "Adrian liked your post", "5m"));
    notificationsModels.add(new NotificationsModel(
        Color(0xFFFF006E), "Adrian liked your post", "2h"));
    notificationsModels.add(new NotificationsModel(
        Color(0xFFFF006E), "Adrian liked your post", "3h"));
    notificationsModels.add(new NotificationsModel(
        Color(0xFFFF006E), "Adrian liked your post", "22h"));
    notificationsModels.add(new NotificationsModel(
        Color(0xFFFF006E), "Adrian liked your post", "1d"));
    notificationsModels.add(new NotificationsModel(
        Color(0xFFFF006E), "Adrian liked your post", "2d"));
    notificationsModels.add(
        new NotificationsModel(Color(0xFFFB5607), "Odd liked your post", "2d"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.clrScreenBG,
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemCount: notificationsModels.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 58,
                color: AppConstants.clrWhite,
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        height: 57,
                        margin: EdgeInsets.only(right: 15),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(left: 15, right: 15),
                              decoration: BoxDecoration(
                                  color: notificationsModels[index].color,
                                  shape: BoxShape.circle),
                            ),
                            TextWidget(notificationsModels[index].title,
                                fontWeight: FontWeight.w400,
                                color: AppConstants.clrBlack,
                                fontSize: AppConstants.size_medium_large),
                            FlexibleWidget(1),
                            TextWidget(notificationsModels[index].hour,
                                fontWeight: FontWeight.w400,
                                color: AppConstants.clrFollowers,
                                fontSize: AppConstants.size_medium)
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                    DividerWidget(
                        height: 1, width: MediaQuery.of(context).size.width),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
