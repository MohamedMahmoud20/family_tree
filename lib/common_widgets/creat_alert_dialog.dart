
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';

import '../providers/language_provider.dart';
import '../utilities/text_style.dart';
import 'creat_button.dart';
import 'creat_text_field.dart';

class CreatAlertDialog {
  LanguageProvider? languageProvider;
  //
  // CreatShowAlertDialogModel({BuildContext? context, page}) {
  //   showModalBottomSheet(
  //       isDismissible: false,
  //       isScrollControlled: true,
  //       context: context!,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
  //       ),
  //       builder: (BuildContext context) {
  //         return Container(
  //             padding: EdgeInsets.symmetric(
  //                 horizontal: getSize(context: context).width * 0.03,
  //                 vertical: getSize(context: context).height * 0.004),
  //             height: getSize(context: context).height * 0.9,
  //             child: page);
  //       });
  // }
  //
  // deleteCartOrNo({BuildContext? context, void Function()? onPressDelete}) {
  //   showDialog(
  //       context: context!,
  //       builder: (BuildContext context) {
  //         languageProvider =
  //             Provider.of<LanguageProvider>(context, listen: false);
  //         return AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //           backgroundColor: secColor,
  //           contentPadding:
  //               EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
  //           elevation: 5,
  //           content: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 textDirection: languageProvider!.isEnglish == true
  //                     ? TextDirection.ltr
  //                     : TextDirection.rtl,
  //                 children: [
  //                   IconButton(
  //                       icon: Icon(
  //                         Icons.cancel,
  //                         size: 23,
  //                         color: mainColor,
  //                       ),
  //                       onPressed: () {
  //                         Navigator.pop(context);
  //                       })
  //                 ],
  //               ),
  //               Text(
  //                 "${languageProvider!.getTexts("multiRestaurant")}",
  //                 // ignore: dead_null_aware_expression
  //                 style: BlackLabel.display5(context),
  //               ),
  //               SizedBox(
  //                 height: getSize(context: context).height * 0.025,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   CreatButton(
  //                     height: getSize(context: context).height * 0.035,
  //                     circularRadius: 10.0,
  //                     width: getSize(context: context).width * 0.18,
  //                     label: languageProvider!.getTexts("cancelOrder"),
  //                     labelStyle: WhiteLabel.display5(context),
  //                     onPressed: onPressDelete,
  //                   ),
  //                   SizedBox(
  //                     width: 18,
  //                   ),
  //                   CreatButton(
  //                     height: getSize(context: context).height * 0.035,
  //                     circularRadius: 10.0,
  //                     width: getSize(context: context).width * 0.18,
  //                     label: languageProvider!.getTexts("back"),
  //                     labelStyle: WhiteLabel.display5(context),
  //                     onPressed: () {
  //                       RoutesManager.pop(context);
  //                     },
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: getSize(context: context).height * 0.01,
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }
  //
  // confirmDeleteAccount({
  //   var controller,
  //   BuildContext? context,
  //   String? title,
  //   Function? onPress,
  // }) {
  //   showDialog(
  //       context: context!,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         languageProvider =
  //             Provider.of<LanguageProvider>(context, listen: false);
  //         return AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //           backgroundColor: Colors.white,
  //           contentPadding: EdgeInsets.only(top: 0, left: 0, right: 0),
  //           elevation: 5,
  //           content: Container(
  //               // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //               height: MediaQuery.of(context).size.height * 0.2,
  //               decoration:
  //                   BoxDecoration(borderRadius: BorderRadius.circular(15)),
  //               child: Directionality(
  //                 textDirection: languageProvider!.isEnglish == true
  //                     ? TextDirection.ltr
  //                     : TextDirection.rtl,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       title ?? " ",
  //                       style: BlackTitle.display5(context),
  //                     ),
  //                     SizedBox(
  //                       height: getSize(context: context).height * 0.01,
  //                     ),
  //                     CreatTextField(
  //                       width: getSize(context: context).width * 0.6,
  //                       obSecureText: true,
  //                       controller: controller,
  //                       suffixIcon: Icon(
  //                         Icons.password,
  //                         color: mainColor,
  //                       ),
  //                       label: languageProvider!.getTexts("password"),
  //                       onChange: (value) {},
  //                     ),
  //                     SizedBox(
  //                       height: getSize(context: context).height * 0.02,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       children: [
  //                         CreatButton(
  //                           height: 30.0,
  //                           width: 90,
  //                           label: languageProvider!.getTexts("yes"),
  //                           labelStyle: WhiteTitle.display5(context),
  //                           onPressed: () {
  //                             Navigator.pop(context);
  //                             onPress!();
  //                           },
  //                         ),
  //                         CreatButton(
  //                           height: 30.0,
  //                           width: 90,
  //                           label: languageProvider!.getTexts("no"),
  //                           labelStyle: WhiteTitle.display5(context),
  //                           onPressed: () {
  //                             Navigator.pop(context);
  //                           },
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               )),
  //         );
  //       });
  // }
}
