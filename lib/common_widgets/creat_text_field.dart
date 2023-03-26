import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';
// ignore: must_be_immutable
class CreatTextField extends StatelessWidget {
  final String? label, title, isBlueHintLabel, priceUnit;
  // final Function? validate, onnChanged, onTap;


  final Function(String val)? onChange;
  final Function(String? val)? onSubmit;
  final String? Function(String? val)? validator;







  final double? width, height, topMargin;
  final Color? fillColor, labelColor;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon, prefixIcon;
  final TextAlign? labelDirection;
  final TextStyle? titleStyle,
      labelStyle,
      errorStyle,
      controllerStyle,
      priceUnitStyle;
  final Decoration? decoration;
   BorderRadius? borderRadius;


  final Widget? icon;



  final bool?
  enable,
      obSecureText,
      isIcon,
      isContact,
      isLoginDecoration;
  final TextInputType? keyboardType;

  CreatTextField({
    this.label,
    this.labelDirection,
    this.borderRadius,

    this.onChange,
    this.title,
    this.topMargin,
    this.fillColor,
    this.labelColor,
    this.width,
    this.titleStyle,
    this.labelStyle,
    this.errorStyle,
    this.maxLines,
    this.height,
    this.controller,
    this.icon,
    this.enable,
    this.obSecureText,
    this.keyboardType,
    this.isBlueHintLabel,
    this.isIcon,
    this.controllerStyle,
    this.priceUnit,
    this.prefixIcon,

    this.isLoginDecoration,
    this.priceUnitStyle, this.onSubmit, this.validator, this.suffixIcon, this.decoration, this.isContact,
  });

  LanguageProvider? languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    // Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: topMargin ?? 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: languageProvider!.isEnglish == true
            ? TextDirection.ltr
            : TextDirection.rtl,
        children: [
          title==null?SizedBox():  Text(title??"",style: titleStyle??BlackTitle.display5(context),) ,




          Directionality(
            textDirection: languageProvider!.isEnglish == true
                ? TextDirection.ltr
                : TextDirection.rtl,

            child: Container(
              margin: EdgeInsets.only(top: 5.0),
              height: height ?? getSize(context: context).height * 0.05,
              width:width??getSize(context: context).width*0.7,
              decoration:BoxDecoration(
                borderRadius: borderRadius??BorderRadius.circular(10),
                // border: Border.all(color: Color(0xffE8E6E9), width: 1),
              ),
              child: TextFormField(
                enabled: enable,
                obscureText: obSecureText ?? false,
                textDirection: languageProvider!.isEnglish == true
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                textAlign:labelDirection==null?languageProvider!.isEnglish == true
                    ? TextAlign.left
                    : TextAlign.right:labelDirection!,
                textAlignVertical: TextAlignVertical.center,
                maxLines: maxLines ?? 1,
                onFieldSubmitted: onSubmit,
                onChanged: onChange,
                validator:validator,
                keyboardType: keyboardType,
                controller: controller,
                style:
                controllerStyle ?? BlackTitle.display5(context).copyWith(color: mainColor),
                decoration: InputDecoration(

                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: isContact==true?
                  getSize(context: context).height*0.001:
                  getSize(context: context).height*0.01,
                      horizontal: getSize(context: context).width*0.03),
                  filled: true,
                  fillColor: fillColor ?? Colors.white,
                  hintText: (label ?? " "),
                  hintStyle:labelStyle?? TextStyle(fontSize: 15,color: mainColor,fontFamily: "Cairo"),
                  errorStyle: errorStyle,
                  suffixIcon:suffixIcon,
                  prefixIcon: prefixIcon,

                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                      borderRadius:borderRadius?? BorderRadius.all(Radius.circular(8))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: greyColor, width: 0.0),
                      borderRadius: borderRadius?? BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
