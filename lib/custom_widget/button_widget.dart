
import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';

// ignore: non_constant_identifier_names
Widget ButtonWidget(BuildContext context, String name, Function onClick,Color bgColor,String icon) {
  return ButtonTheme(
    minWidth: MediaQuery.of(context).size.width,
    height: 44,
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
    child: FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon !=null?  Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset(icon,height: 20,width: 20),
          ):Container(height: 1,),
          TextWidget(name,
              color: AppConstants.clrWhite,
              fontSize: AppConstants.size_large,
              fontWeight: FontWeight.normal),
        ],
      ),
      color:bgColor,
    ),
  );
}
