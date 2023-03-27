import 'package:family_tree/common_widgets/creat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_manager/local_data.dart';
import '../../common_widgets/create_button2.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LanguageProvider? languageProvider;

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
              SizedBox(height: 10,),
              Text(
                languageProvider!.getTexts("login"),
                style: MainTitle.display5(context)
                    .copyWith(color: mainColor2, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getSize(context: context).height * 0.04,),
              Text(
                languageProvider!.getTexts("enterPhone2"),
                style: MainTitle.display5(context)
                    .copyWith(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getSize(context: context).height * 0.02,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(flex:2,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(languageProvider!.getTexts("countryKey"),style: MainLabel.display5(context).copyWith(color: mainColor2),),
                        CreatTextField(
                          label: "966",
                          labelStyle: MainLabel.display5(context).copyWith(color: Colors.grey),
                        )
                      ],
                    )),


                    SizedBox(width: 10,),

                    Expanded(flex:5,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(languageProvider!.getTexts("phone"),style: MainLabel.display5(context).copyWith(color: mainColor2),),
                        CreatTextField(
                          label: languageProvider!.getTexts("phone"),
                          labelStyle: MainLabel.display5(context).copyWith(color: Colors.grey),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              SizedBox(height: getSize(context: context).height * 0.1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CreateButton2(
                  title: languageProvider!.getTexts("next"),
                  color: mainColor,
                ),
                Align(alignment: Alignment.centerLeft,
                    child: IconButton(icon: Icon(Icons.arrow_forward_ios_sharp, color: mainColor, size: 30,), onPressed: () {})),

              ],)
            ],
          ),
        ),
      ),
    );
  }
}
