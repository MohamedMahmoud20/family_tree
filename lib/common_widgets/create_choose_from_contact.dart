import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';
import 'creat_text_field.dart';

class CreateChooseFromContact extends StatefulWidget {
  const CreateChooseFromContact({Key? key}) : super(key: key);

  @override
  State<CreateChooseFromContact> createState() => _CreateChooseFromContactState();
}

class _CreateChooseFromContactState extends State<CreateChooseFromContact> {

  LanguageProvider? languageProvider;


  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: languageProvider!.isEnglish == false
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 10,),
          Column(
            children: [
              SizedBox(height: getSize(context: context).height*0.01,),
              FaIcon(FontAwesomeIcons.remove,size: 20,color: Colors.red,),
              // FaIcon(FontAwesomeIcons.remove,size: 25),
            ],
          ),
          Expanded(
            child: CreatTextField(
              isContact: true,
              height: getSize(context: context).height*0.04,
              fillColor: greyColor,
              label: languageProvider!.getTexts("click"),
              labelStyle: WhiteTitle.display5(context),
              suffixIcon: suffix(onTap: (){
                print("Click");
              }),

            ),
          ),

        ],
      ),
    );
  }


  Widget suffix({
  required onTap
}){
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: mainColor2,
            borderRadius: BorderRadius.only(
              bottomLeft:languageProvider!.isEnglish==true?
              Radius.circular(0):Radius.circular(5),
              topLeft: languageProvider!.isEnglish==true?
              Radius.circular(0):Radius.circular(5),
              bottomRight:languageProvider!.isEnglish==true?
              Radius.circular(5):Radius.circular(0),
              topRight: languageProvider!.isEnglish==true?
              Radius.circular(5):Radius.circular(0),
            )
        ),
        child: SvgPicture.asset("assets/images/choose.svg"),
      ),
    );
  }

}
