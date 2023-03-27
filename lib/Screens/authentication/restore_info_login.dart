import 'package:family_tree/app_manager/local_data.dart';
import 'package:family_tree/common_widgets/creat_text_field.dart';
import 'package:family_tree/common_widgets/create_button2.dart';
import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/language_provider.dart';

class RestoreInfoLogin extends StatefulWidget {
  const RestoreInfoLogin({Key? key}) : super(key: key);

  @override
  State<RestoreInfoLogin> createState() => _RestoreInfoLoginState();
}

class _RestoreInfoLoginState extends State<RestoreInfoLogin> {
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
                languageProvider!.getTexts("restoreRegister"),
                style: MainTitle.display5(context)
                    .copyWith(color: mainColor2, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSize(context: context).height * 0.02,
              ),
              Text(
                languageProvider!.getTexts("enterPhone"),
                style: MainTitle.display5(context)
                    .copyWith(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSize(context: context).height * 0.04,
              ),
              CreatTextField(
                labelStyle: MainLabel.display5(context),
                labelDirection: TextAlign.center,
                label: languageProvider!.getTexts("phone"),
              ),
              SizedBox(
                height: getSize(context: context).height * 0.08,
              ),
              Container(
                margin:  EdgeInsets.symmetric(horizontal: getSize(context: context).width * 0.2),
                child: Text(
                  languageProvider!.getTexts("note2"),
                  style: MainTitle.display5(context)
                      .copyWith(color: Colors.grey, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: getSize(context: context).height * 0.08,
              ),
              CreateButton2(
                title: languageProvider!.getTexts("send"),
                color: mainColor,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
