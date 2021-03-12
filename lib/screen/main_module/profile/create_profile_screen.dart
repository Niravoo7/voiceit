import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  
  List<TempModel> tempModel = List<TempModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tempModel.add(TempModel(AppConstants.clrTabNotifications,'Gunnar','2h','Dagens tanker',AppConstants.clrTabCreate));
    tempModel.add(TempModel(AppConstants.clrTabSearch,'Adrian','2h','WHATS UP!',AppConstants.clrTabProfile));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.clrScreenBG,
      body: ListView.builder(
          itemCount: tempModel.length,
          itemBuilder: (context, index) {
        return Column(

          children: [
            Container(
              color: AppConstants.clrWhite,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        color: tempModel[index].imageColor,
                        shape: BoxShape.circle),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget( tempModel[index].name,
                          textOverflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          color: AppConstants.clrBlack,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          fontSize: AppConstants.size_large),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: TextWidget( tempModel[index].time,
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
            ),
            Container(

              height: 138,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                  color: tempModel[index].bgColor,
                  image: DecorationImage(
                      image: AssetImage(
                          AppConstants.img_xmlid),
                      fit: BoxFit.cover)),
              child:  Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22,top: 15),
                  child: TextWidget(
                      tempModel[index].title,
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      color: AppConstants.clrWhite,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.right,
                      fontSize: AppConstants.size_extra_large),
                ),
              ),)
          ],
        );
      }),
    );
  }
}
class TempModel{
  Color imageColor;
  String name;
  String time;
  String title;
  Color bgColor;

  TempModel(this.imageColor, this.name, this.time, this.title, this.bgColor);
}