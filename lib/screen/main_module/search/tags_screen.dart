import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/divider_widget.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/model/tags_model.dart';

class TagsScreen extends StatefulWidget {
  @override
  _TagsScreenState createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  List<TagsModel> tagsModels = new List<TagsModel>();

  @override
  void initState() {
    super.initState();
    tagsModels.add(new TagsModel("#voiceit", "304m voices"));
    tagsModels.add(new TagsModel("#coolbeans", "143k voices"));
    tagsModels.add(new TagsModel("#odderbest", "4 voices"));
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
            itemCount: tagsModels.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 46,
                color: AppConstants.clrWhite,
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.only(right: 16, left: 16),
                        child: Row(
                          children: [
                            TextWidget(tagsModels[index].hashTag,
                                fontWeight: FontWeight.w700,
                                color: AppConstants.clrBlack,
                                fontSize: AppConstants.size_large),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                height: 4,
                                width: 4,
                                decoration: BoxDecoration(
                                    color: AppConstants.clrFollowers,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            TextWidget(tagsModels[index].voices,
                                fontWeight: FontWeight.w400,
                                color: AppConstants.clrFollowers,
                                fontSize: AppConstants.size_large)
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
