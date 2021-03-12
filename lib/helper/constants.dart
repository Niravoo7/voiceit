import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstants {
  //color
  static const Color clrWhite = Color(0xFFFFFFFF);
  static const Color clrRedAccent = Color(0xFFFF0000);
  static const Color clrGreenAccent = Color(0xFF00FF00);
  static const Color clrBlueAccent = Color(0xFF0000FF);
  static const Color clrBlueLight = Color(0xFFA8CED7);
  static const Color clrYellowAccent = Color(0xFFFFAA1D);
  static const Color clrDivider = Color(0xFFE9E9E9);
  static const Color clrDarkGrey = Color(0xFF9C9C9C);
  static const Color clrGrey = Color(0xFFE5E5E5);
  static const Color clrBlack = Color(0xFF000000);
  static const Color clrTransparent = Color(0x00000000);
  static const Color clrInputBorder = Color(0xFFEEEEEE);
  static const Color clrFollowers = Color(0xFF545454);
  static const Color clrText = Color(0xFF467187);
  static const Color clrBtnNo = Color(0x55FBBE8B);
  static const Color clrScreenBG = Color(0xFFF0F0F0);
  static const Color clrSearchBG = Color(0xFFEDEDED);
  static const Color clrSearchIconColor = Color(0xFFA1A1A1);
  static const Color clrAddFriends = Color(0xFFB5B5B5);
  static const Color clrClickHere = Color(0xFF686868);

  static const Color clrTabSearch = Color(0xFFFFBE0B);
  static const Color clrTabMessages = Color(0xFFFB5607);
  static const Color clrTabCreate = Color(0xFF00BE6E);
  static const Color clrTabNotifications = Color(0xFFFF006E);
  static const Color clrTabProfile = Color(0xFF3A86FF);
  static const Color clrBackBtn = Color(0xFF8F8F8F);
  static const Color clrBtnBG = Color(0xFFA6A6A6);
  static const Color clrGreyTex = Color(0xFFB0B0B0);
  static const Color clrGreyBorder = Color(0xFFBBBBBB);
  static const Color clrGreyBG = Color(0xFFD6D6D6);
  static const Color clrGreyChatTextField = Color(0xFFEBEBEB);
  static const Color clrGreySendIcon = Color(0xFFCACACA);

  //fonts
  static const String fontRoboto = "Roboto";

  //size
  static const double size_extra_small = 11;
  static const double size_small = 12;
  static const double size_small_medium = 13;
  static const double size_medium = 14;
  static const double size_medium_large = 16;
  static const double size_large = 18;
  static const double size_extra_large = 24;
  static const double size_double_extra_large = 34;
  static const double size_triple_extra_large = 60;

  static const double size_text_large = 24;
  static const double size_text_medium = 18;
  static const double size_text_small = 14;
  static const double size_input_text = 18;

  //images
  static const String root_image = "assets/images";
  static const String img_add_friends = '$root_image/img_add_friends.png';
  static const String img_close = '$root_image/img_close.png';
  static const String img_create_voice = '$root_image/img_create_voice.png';
  static const String img_main_logo = '$root_image/img_main_logo.png';
  static const String img_main_text_logo = '$root_image/img_main_text_logo.png';
  static const String img_messages = '$root_image/img_messages.png';
  static const String img_my_profile_bg = '$root_image/img_my_profile_bg.png';
  static const String img_my_profile_bg1 = '$root_image/img_my_profile_bg1.png';
  static const String img_notification = '$root_image/img_notification.png';
  static const String img_played = '$root_image/img_played.png';
  static const String img_profile = '$root_image/img_profile.png';
  static const String img_round = '$root_image/img_round.png';
  static const String img_search = '$root_image/img_search.png';
  static const String img_sent = '$root_image/img_sent.png';
  static const String img_share = '$root_image/img_share.png';
  static const String img_union = '$root_image/img_union.png';
  static const String img_xmlid = '$root_image/img_xmlid.png';
  static const String img_tortoise = '$root_image/img_tortoise.png';
  static const String img_rabbit = '$root_image/img_rabbit.png';

  //string
  static const String str_app_name = "VoiceIT";
  static const String str_no_network = "Please Check Your Internet Connection.";
  static const String str_no_record_found = "No Records found.";
  static const String str_email = "Email";
  static const String str_password = "Password (case sensitive)";
  static const String str_remember = "Remember My User ID";
  static const String str_sign_in = "Sign In";
  static const String str_forgot_password = "Forgot User ID / Password?";
  static const String str_enter_email = "Email address required.";
  static const String str_valid_email = "Please enter valid email.";
  static const String str_enter_pwd = "Password required.";
  static const String str_valid_pwd = "Password should be in 6 digits.";

  static const String str_drawer_settings = "Settings";
  static const String str_drawer_sign_out = "Sign Out";
  static const String str_start = "start";
  static const String str_min = "min";
  static const String str_id = "id";
  static const String str_card_id = "card id";
  static const String str_index = "index";
  static const String str_card_type = "card type";
  static const String str_placeholder_finish = "Placeholder Finish";
  static const String str_placeholder_start = "Placeholder Start";
  static const String str_finish = "FINISH";
  static const String str_question = "?";
  static const String str_yes = "Yes";
  static const String str_no = "No";
  static const String str_mindfulness_boost = "MINDFULNESS BOOST";
  static const String str_max_selected = "Maximum Option Selected!!";
  static const String str_are_you_sure_you_want_to_exit =
      "Are you sure you want to exit?";
  static const String str_each_boost_has_different_questions_and_tasks =
      "Each boost has different questions and tasks!";
  static const String str_exitApp = 'Exit App?';
  static const String str_coolPeople = 'Cool People';
  static const String str_search = 'Search';
  static const String str_messages = 'Messages';
  static const String str_create = 'Create';
  static const String str_notifications = 'Notifications';
  static const String str_profile = 'Profile';
  static const String str_people = 'PEOPLE';
  static const String str_tags = 'TAGS';
  static const String str_addFriends = 'ADD FRIENDS';
  static const String str_clickHere = 'Click here to add more firends...';
  static const String str_dagensTanker = 'Dagens tanker';
  static const String str_hashTages = '#følesbra #stol #pult #power';
  static const String str_sendTo = 'SEND TO';
  static const String str_send = 'SEND';
  static const String str_shae = 'SHARE';
  static const String str_postTitle = 'Give your post a title...';
  static const String str_newPost = 'NEW POST';
  static const String str_stolPower = '#stol #power';
  static const String str_publishOnProfile = 'PUBLISH ON PROFILE';
  static const String str_addEffect = 'ADD EFFECT';
  static const String str_highPitch = 'High pitch';
  static const String str_highPitchDetail = 'Sounds like fast forward';
  static const String str_lowPitch = 'Low pitch';
  static const String str_lowPitchDetail = 'Sounds like slow motion';
  static const String str_commingSoon = 'Comming soon...';
  static const String str_done = 'DONE';
  static const String str_messageFromGunnar = 'Message from Gunnar';
  static const String str_team = 'Team RøLAN';
  static const String str_voiceBack = 'VOICE BACK!';
  static const String str_groupVoice = 'Group voice';
  static const String str_writeYourReply = 'Write your reply...';
}
