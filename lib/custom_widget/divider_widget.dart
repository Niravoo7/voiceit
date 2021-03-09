import 'package:flutter/material.dart';
import 'package:voiceit/helper/constants.dart';

// ignore: non_constant_identifier_names
Widget DividerWidget({double height, double width}) {
  return Container(
    height: height,
    width: width,
    color: AppConstants.clrDivider,
  );
}
