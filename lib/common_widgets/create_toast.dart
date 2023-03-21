

import 'package:toast/toast.dart';

import 'dart:ui';

import '../app_manager/local_data.dart';
import '../utilities/text_style.dart';


class CreatToast{
  void showToast({  required String errorMessage,  required context , int ?gravity ,   Color? backgroundColor  ,var labelStyle} ) {
    ToastContext().init(context);
    Toast.show(

      errorMessage,
      textStyle: labelStyle??WhiteLabel.display5(context),
      duration: Toast.lengthLong,
      gravity:gravity?? Toast.center,
      backgroundRadius: 10,
      backgroundColor:backgroundColor?? mainColor,

    );

  }
// void showInternetToast({String errorMessage, context ,}) {
//   Toast.show(
//       errorMessage,
//       context,
//       duration: 5,
//       gravity: Toast.CENTER,
//       textColor: whiteColor,
//       backgroundRadius: 10,
//       backgroundColor: mainColor
//
//   );
//
// }
// void showInternetToast({String errorMessage, context ,}) {
//   Fluttertoast.showToast(
//       errorMessage,
//       context,
//       duration: Toast.LENGTH_LONG,
//       gravity: Toast.CENTER,
//       textColor: whiteColor,
//       backgroundRadius: 10,
//       backgroundColor: mainColor,
//
//   );
//   // back == true ? Navigator.pop(context) : () {};
// }



}