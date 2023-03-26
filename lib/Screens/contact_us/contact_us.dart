import 'package:family_tree/Screens/deaths_screen/death_screen.dart';
import 'package:family_tree/app_manager/local_data.dart';
import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:family_tree/common_widgets/creat_app_bar.dart';
import 'package:family_tree/providers/language_provider.dart';
import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/creat_alert_dialog.dart';
import '../briths_screens/briths_screen.dart';

// ignore: must_be_immutable
class ContactUs extends StatelessWidget {
  LanguageProvider? languageProvider;

/////////////////////////////  بيضسف منها كل حاجه///////////////////////
  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      appBar: CreatAppBar(
        icon: "assets/images/contact.svg",
        onIconPressed: () {},
        iconTitle: languageProvider!.getTexts("contact"),
        hasBackButton: true,
      ),
      body: Directionality(
        textDirection: languageProvider!.isEnglish == true
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [
            creatTitle(
                title: languageProvider!.getTexts("communication"),
                context: context),
            creatContactChannel(context: context),
            creatTitle(
                title: languageProvider!.getTexts("PersonalForms"),
                context: context),
            creatLongButton(
                context: context,
                title: languageProvider!.getTexts("MyPage"),
                onTap: () {

                }),
            Row(
              children: [
                creatShortButton(
                    context: context,
                    title: languageProvider!.getTexts("treePeople"),
                    onTap: () {}),
                SizedBox(width: getSize(context: context).width * 0.04),
                creatShortButton(
                    context: context,
                    title: languageProvider!.getTexts("lives"),
                    onTap: () {}),
              ],
            ),
            creatTitle(
                title: languageProvider!.getTexts("NewsForms"),
                context: context),
            Row(
              children: [
                creatShortButton(
                    context: context,
                    title: languageProvider!.getTexts("publicNews"),
                    onTap: () {}),
                SizedBox(width: getSize(context: context).width * 0.04),
                creatShortButton(
                    context: context,
                    title: languageProvider!.getTexts("birthNews"),
                    onTap: () {
                      RoutesManager.navigatorPush(context, BirthsScreen());
                    }),
              ],
            ),
            Row(
              children: [
                creatShortButton(
                    context: context,
                    title: languageProvider!.getTexts("deathNews"),
                    onTap: () {
                      RoutesManager.navigatorPush(context, DeathsScreen());
                    }),
                SizedBox(width: getSize(context: context).width * 0.04),
                creatShortButton(
                    context: context,
                    title: languageProvider!.getTexts("eventNews"),
                    onTap: () {}),
              ],
            ),
            creatTitle(
                title: languageProvider!.getTexts("galleryForms"),
                context: context),
            creatLongButton(
                context: context,
                title: languageProvider!.getTexts("photoGallery"),
                onTap: () {}),
            creatTitle(
                title: languageProvider!.getTexts("GeneralForms"),
                context: context),
            Row(
              children: [
                creatShortButton(
                    context: context,
                    title: languageProvider!.getTexts("generalCommunication"),
                    onTap: () {}),
                SizedBox(width: getSize(context: context).width * 0.04),
                creatShortButton(
                    context: context,
                    title:
                    languageProvider!.getTexts("TechnicalCommunications"),
                    onTap: () {}),
              ],
            ),
            SizedBox(height: getSize(context: context).height*0.04,)
          ],
        ),
      ),
    );
  }

  Widget creatShortButton(
      {required BuildContext context,
        required String title,
        required void Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(top: getSize(context: context).height * 0.02),
          child: Material(
            elevation: 1.5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              height: getSize(context: context).height * 0.1,
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 3,
                //     blurRadius: 0,
                //     offset: Offset(0, 2), // changes position of shadow
                //   ),
                // ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Text(
                title,
                style: BlackTitle.display5(context).copyWith(fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget creatLongButton(
      {required BuildContext context,
        required String title,
        required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: getSize(context: context).height * 0.02),
        child: Material(
          elevation: 1.5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.center,
            height: getSize(context: context).height * 0.1,
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 3,
              //     blurRadius: 7,
              //     offset: Offset(0, 2), // changes position of shadow
              //   ),
              // ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Text(
              title,
              style: BlackTitle.display5(context).copyWith(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget creatTitle({
    required String title,
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.only(top: getSize(context: context).height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: BlackLabel.display5(context),
          )
        ],
      ),
    );
  }

  Widget creatContactChannel({
    required BuildContext context,
  }) {
    return Container(
      margin: EdgeInsets.only(top: getSize(context: context).height * 0.02),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        InkWell(
            onTap: () {
              CreatAlertDialog().contactAlert(context: context , icon: Icons.email, title: languageProvider!.getTexts("create"));
            },
            child:Icon(Icons.email , color: mainColor2,size: 40,)
        ),
        InkWell(
            onTap: () {
              CreatAlertDialog().contactAlert(context: context , icon: Icons.phone, title: languageProvider!.getTexts("call"));

            },
            child:Icon(Icons.phone , color: mainColor2,size: 40,)
        ),
        InkWell(
            onTap: () {
              CreatAlertDialog().contactAlert(context: context , icon: Icons.messenger, title: languageProvider!.getTexts("open"));

            },
            child:Icon(Icons.messenger , color: mainColor2,size: 40,)
        ),
      ]),
    );
  }
}