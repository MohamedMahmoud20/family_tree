import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

// ignore: must_be_immutable
class CreateButton2 extends StatelessWidget {

  LanguageProvider? languageProvider;
  String? title;
  bool? isIcon;
  Color? color;
  void Function()? onTap;

  CreateButton2({this.title,this.color,this.isIcon,this.onTap});

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return  InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color:color?? greyColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        ),
        child:  Container(
          padding: EdgeInsets.symmetric(horizontal: isIcon==true?getSize(context: context).width*0.05: getSize(context: context).width*0.08,
              vertical: isIcon==true?3:4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title??languageProvider!.getTexts("review"), style: WhiteTitle.display5(context).copyWith(fontSize: 15),),
              isIcon==true? SizedBox(width:  getSize(context: context).width*0.02,):SizedBox(),
              isIcon==true? Icon(Icons.arrow_forward_ios_outlined,
                size: 18,color: Colors.white,):SizedBox()

            ],
          ),
        ),
      ),
    );
  }
}
