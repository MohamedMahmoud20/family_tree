import 'package:family_tree/app_manager/local_data.dart';
import 'package:family_tree/common_widgets/creat_text_field.dart';
import 'package:family_tree/common_widgets/create_button2.dart';
import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';

class InformationLogin extends StatefulWidget {
  const InformationLogin({Key? key}) : super(key: key);

  @override
  State<InformationLogin> createState() => _InformationLoginState();
}

class _InformationLoginState extends State<InformationLogin> {
  LanguageProvider? languageProvider;

  bool checkBox=false;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: getSize(context: context).height*0.02,vertical: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: mainColor2,
                          size: 30,
                        ),
                        onPressed: () {})),
              ),
              Image.asset("assets/images/splash.png" , height: 200,width: 200,),
              Text(
                languageProvider!.getTexts("loginEntry"),
                style: MainTitle.display5(context)
                    .copyWith(color: mainColor2, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSize(context: context).height * 0.02,
              ),
              userNameAndPassword()

            ],
          ),
        ),
      ),
    );
  }
  Widget userNameAndPassword(){
    return Column(
      children: [
        CreatTextField(
          labelStyle: MainLabel.display5(context),
          labelDirection: TextAlign.center,
          label: languageProvider!.getTexts("userName"),
        ),
        SizedBox(
          height: getSize(context: context).height * 0.01,
        ),
        CreatTextField(
          labelStyle: MainLabel.display5(context),
          labelDirection: TextAlign.center,
          label: languageProvider!.getTexts("password"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              languageProvider!.getTexts("checkLogin"),
              style: MainTitle.display5(context).copyWith(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            Checkbox(
              focusColor: Colors.red,
              value: checkBox,
              shape: CircleBorder(),
              onChanged: (value) {
                setState(() {checkBox=! checkBox;});
              },
            ),
          ],
        ),
        SizedBox(height: getSize(context: context).height*0.02,),
        Text(
          languageProvider!.getTexts("note"),
          style: MainLabel.display5(context).copyWith(color: greyColor),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: getSize(context: context).height*0.07,),
        CreateButton2(
          title: languageProvider!.getTexts("enter"),
          color: mainColor,
        ),
        SizedBox(height: getSize(context: context).height*0.07,),
        Text(
          languageProvider!.getTexts("forgetPassword"),

          style: MainTitle.display5(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
