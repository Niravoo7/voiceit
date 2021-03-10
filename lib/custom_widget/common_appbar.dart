
import 'package:flutter/material.dart';
import 'package:voiceit/custom_widget/text_widget.dart';
import 'package:voiceit/helper/constants.dart';

// ignore: non_constant_identifier_names
Widget CommonAppBar(BuildContext context, String pageName) {
  return AppBar(
   // titleSpacing: 0.0,
    centerTitle: true,
    backgroundColor: AppConstants.clrWhite,
    elevation: 1,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: AppConstants.clrBackBtn),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: TextWidget(pageName,
        textOverflow: TextOverflow.ellipsis,
        maxLines: 1,
        color: AppConstants.clrBlack,
        fontWeight: FontWeight.normal,
        textAlign: TextAlign.center,
        fontSize: AppConstants.size_large),
  );
}
