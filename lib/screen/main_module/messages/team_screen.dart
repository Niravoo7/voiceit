import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<TempTitleModel> tempTitleModel = List<TempTitleModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    List<TempAudioModel> tempAudioModel1 = List<TempAudioModel>();
    tempAudioModel1.add(TempAudioModel(AppConstants.img_xmlid, '8h',AppConstants.clrTabCreate));
    List<TempAudioModel> tempAudioModel2 = List<TempAudioModel>();
    tempAudioModel2.add(TempAudioModel(AppConstants.img_xmlid, '6h',AppConstants.clrTabCreate));
    List<TempAudioModel> tempAudioModel3 = List<TempAudioModel>();
    tempAudioModel3.add(TempAudioModel(AppConstants.img_xmlid, '',AppConstants.clrTabSearch));
    tempAudioModel3.add(TempAudioModel(AppConstants.img_xmlid, '3h',AppConstants.clrTabSearch));
    tempAudioModel3.add(TempAudioModel(AppConstants.img_xmlid, '3h',AppConstants.clrTabSearch));

    tempTitleModel.add(TempTitleModel('Janki89',AppConstants.clrTabProfile, tempAudioModel1));
    tempTitleModel.add(TempTitleModel('Odd',AppConstants.clrTabMessages, tempAudioModel2));
    tempTitleModel.add(TempTitleModel('Adrian',AppConstants.clrYellowAccent, tempAudioModel3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.clrScreenBG,
      body: Column(
        children: [
          Container(
            color: AppConstants.clrWhite,
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: AppConstants.clrTabProfile,
                          shape: BoxShape.circle),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(AppConstants.str_team,
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            color: AppConstants.clrBlack,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            fontSize: AppConstants.size_large),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: TextWidget(AppConstants.str_groupVoice,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              color: AppConstants.clrFollowers,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.center,
                              fontSize: AppConstants.size_medium_large),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: AppConstants.clrBlack,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tempTitleModel.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(tempTitleModel[index].name,
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            color:tempTitleModel[index].textNameColor,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.center,
                            fontSize: AppConstants.size_medium),
                      ),
                      ListView.builder(
                          itemCount: tempTitleModel[index].tempAudioModel
                              .length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index1) {
                            return Container(

                                height: 63,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                margin: EdgeInsets.only(bottom: 8),
                                decoration: BoxDecoration(
                                    color: tempTitleModel[index]
                                        .tempAudioModel[index1].bg,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            tempTitleModel[index]
                                                .tempAudioModel[index1]
                                                .audio),
                                        fit: BoxFit.cover)),
                                child:  Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextWidget(
                                        tempTitleModel[index].tempAudioModel[index1]
                                            .time,
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        color: AppConstants.clrBlack,
                                        fontWeight: FontWeight.normal,
                                        textAlign: TextAlign.right,
                                        fontSize: AppConstants.size_medium_large),
                                  ),
                                ),);
                          })
                    ],
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(15.0),
        height: 61,
        child: Row(
          children: [
            Container(
              height: 43,
              width: 43,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppConstants.clrTabCreate, shape: BoxShape.circle),
              child: InkWell(
                child: Image.asset(AppConstants.img_union),
                onTap: () {},
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: AppConstants.clrGreyChatTextField,
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            hintText: AppConstants.str_writeYourReply,
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: AppConstants.clrGreySendIcon,
                          shape: BoxShape.circle),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.send),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TempTitleModel {
  String name;
  Color textNameColor;
  List<TempAudioModel> tempAudioModel;

  TempTitleModel(this.name,this.textNameColor, this.tempAudioModel);
}

class TempAudioModel {
  String audio;
  String time;
  Color bg;

  TempAudioModel(this.audio, this.time,this.bg);
}
