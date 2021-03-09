import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/divider_widget.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/model/people_model.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  List<PeopleModel> peopleModels = new List<PeopleModel>();

  @override
  void initState() {
    super.initState();
    peopleModels
        .add(new PeopleModel(Color(0xFFFF006E), "Gunnar", "99m followers"));
    peopleModels
        .add(new PeopleModel(Color(0xFFFFBE0B), "Adrian", "100m followers"));
    peopleModels.add(new PeopleModel(Color(0xFFFB5607), "Odd", "2m followers"));
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
            itemCount: peopleModels.length,
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
                            Container(
                              height: 48,
                              width: 48,
                              margin: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  color: peopleModels[index].color,
                                  shape: BoxShape.circle),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(peopleModels[index].name,
                                      fontWeight: FontWeight.w400,
                                      color: AppConstants.clrBlack,
                                      fontSize: AppConstants.size_large),
                                  TextWidget(peopleModels[index].followers,
                                      fontWeight: FontWeight.w400,
                                      color: AppConstants.clrFollowers,
                                      fontSize: AppConstants.size_medium_large)
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
                        height: 1, width: MediaQuery.of(context).size.width),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
