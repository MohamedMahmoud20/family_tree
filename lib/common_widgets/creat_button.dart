import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

class CreatButton extends StatelessWidget {
  final double? height, width, circularRadius;
  final void Function()? onPressed;
  final String? label, title;
  final Color? backGround;
  final TextStyle? labelStyle;

  CreatButton({
    Key? key,
    this.height,
    this.width,
    this.onPressed,
    this.label,
    this.backGround,


    this.labelStyle,
    this.title,

    this.circularRadius

  }) : super(key: key);

  LanguageProvider? languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return InkWell(
      onTap:onPressed,
      child: Container(
        height: height??  getSize(context: context).height * 0.05,
        width: width??  double.infinity,
        // margin: EdgeInsets.symmetric(horizontal: getSize(context: context).width*0.15,
        //     vertical:  getSize(context: context).height * 0.08),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backGround == null ? mainColor : backGround,
            borderRadius: BorderRadius.circular(circularRadius ?? 8)),
        child:
            Text(label ?? " ", style: labelStyle ?? WhiteTitle.display5(context)),

      ),
    );
  }
}
