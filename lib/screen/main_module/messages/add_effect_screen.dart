import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/button_widget.dart';
import 'package:voiceit/custom_widget/common_appbar.dart';
import 'package:voiceit/custom_widget/flexible_widget.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';
import 'package:voiceit/model/add_effect_model.dart';

class AddEffectScreen extends StatefulWidget {
  @override
  _AddEffectScreenState createState() => _AddEffectScreenState();
}

class _AddEffectScreenState extends State<AddEffectScreen> {

  List<AddEffectModel> addEffectModel =  List<AddEffectModel>();
  int selectedRadio = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addEffectModel.add(new AddEffectModel(
        AppConstants.img_rabbit, AppConstants.str_highPitch, AppConstants.str_highPitchDetail,1));
    addEffectModel.add(new AddEffectModel(
        AppConstants.img_tortoise, AppConstants.str_lowPitch, AppConstants.str_lowPitchDetail,2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(context, AppConstants.str_addEffect),
      backgroundColor: AppConstants.clrScreenBG,
      body: Stack(
        children: [
          ListView(
              children: [
                Container(
                  color: AppConstants.clrTabCreate,
                  height: 138,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    AppConstants.img_xmlid,
                  ),
                ),
                ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 18,bottom: 10),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 12),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppConstants.clrGreyBG,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                                width: 2, color: AppConstants.clrGreyBorder)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Image.asset(addEffectModel[index].image,height: 45,width: 45,)),
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: TextWidget(addEffectModel[index].name,
                                        fontWeight: FontWeight.normal,
                                        color: AppConstants.clrBlack,
                                        fontSize: AppConstants.size_large),
                                  ),
                                  TextWidget(addEffectModel[index].detail,
                                      fontWeight: FontWeight.normal,
                                      color: AppConstants.clrFollowers,
                                      fontSize: AppConstants.size_large),
                                ],
                              ),
                            ),
                            FlexibleWidget(1),
                            Flexible(
                                flex: 1,
                               child:   Radio(
                                 materialTapTargetSize:MaterialTapTargetSize.shrinkWrap ,
                                 value: addEffectModel[index].selected,
                                 groupValue: selectedRadio,
                                 activeColor: Colors.green,
                                 onChanged: (val) {
                                   setState(() {
                                     selectedRadio = val;
                                   });
                                 },
                               ),
                            )
                          ],
                        ),
                      );
                    }),
                Center(
                  child: TextWidget(AppConstants.str_commingSoon,
                      fontWeight: FontWeight.normal,
                      color: AppConstants.clrFollowers,
                      fontSize: AppConstants.size_large,textAlign: TextAlign.center),
                ),
              ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: AppConstants.clrScreenBG,
                margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: ButtonWidget(context, AppConstants.str_done, () {
                /*  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEffectScreen()));*/
                }, AppConstants.clrGreyBG, null)),
          ),
        ],
      ),
    );
  }
}
