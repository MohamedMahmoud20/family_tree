import 'package:family_tree/common_widgets/create_choose_from_contact.dart';
import 'package:family_tree/common_widgets/create_drop_down_small.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_manager/local_data.dart';
import '../../common_widgets/creat_text_field.dart';
import '../../common_widgets/create_button2.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';

class CompleteData extends StatefulWidget {
  const CompleteData({Key? key}) : super(key: key);

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
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
                languageProvider!.getTexts("enterYourData"),
                style: MainTitle.display5(context)
                    .copyWith(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getSize(context: context).height * 0.02,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: getSize(context: context).width*0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      languageProvider!.getTexts("fatherName"),
                      style: MainTitle.display5(context)
                          .copyWith(color: mainColor2, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    CreateChooseFromContact(),
                    SizedBox(
                      height: getSize(context: context).height * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          languageProvider!.getTexts("babyName4"),
                          style: MainTitle.display5(context)
                              .copyWith(color: mainColor2, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            SizedBox(width: getSize(context: context).height * 0.01,),

                            Expanded(child: CreatTextField(
                              height: getSize(context: context).height * 0.05,
                              label: languageProvider!.getTexts("fourthName"),
                              labelStyle: MainLabel.display5(context).copyWith(fontSize: 10),
                            )),

                            SizedBox(width: getSize(context: context).height * 0.01,),

                            Expanded(child: CreatTextField(
                              height: getSize(context: context).height * 0.05,
                              label: languageProvider!.getTexts("thirdName"),
                              labelStyle: MainLabel.display5(context).copyWith(fontSize: 10),
                            )),

                            SizedBox(width: getSize(context: context).height * 0.01,),

                            Expanded(child: CreatTextField(
                              height: getSize(context: context).height * 0.05,
                              label: languageProvider!.getTexts("secondName"),
                              labelStyle: MainLabel.display5(context).copyWith(fontSize: 10),
                            )),

                            SizedBox(width: getSize(context: context).height * 0.01,),

                            Expanded(child: CreatTextField(
                              height: getSize(context: context).height * 0.05,
                              label: languageProvider!.getTexts("firstName"),
                              labelStyle: MainLabel.display5(context).copyWith(fontSize: 10),
                            )),


                          ],
                        )
                      ],)

                  ],
                ),
              ),
              SizedBox(height: getSize(context: context).height * 0.03,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      languageProvider!.getTexts("gender"),
                      style: MainTitle.display5(context)
                          .copyWith(color: mainColor2, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 5,),
                    Align(alignment: Alignment.centerRight,child: CreateDropDownSmall()),
                  ],
                ),
              ),





              SizedBox(height: getSize(context: context).height * 0.1,),
              CreateButton2(
                title: languageProvider!.getTexts("enter2"),
                color: mainColor,
              ),

            ],
          ),
        ),
      ),
    );
  }

}
