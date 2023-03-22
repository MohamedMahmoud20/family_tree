import 'package:family_tree/Screens/guide_screens/chart_screen.dart';
import 'package:family_tree/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../app_manager/routes_manager.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

class CreatAppBarGuide extends StatefulWidget with PreferredSizeWidget {
  final Size preferredSize;

  CreatAppBarGuide({
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  State<CreatAppBarGuide> createState() => _CreatAppBarGuideState();
}

class _CreatAppBarGuideState extends State<CreatAppBarGuide> {
  bool? isArabic;
  LanguageProvider? languageProvider;

  @override
  void initState() {
    // isArabic = !languageProvider!.isEnglish;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
        textDirection: languageProvider!.isEnglish == true
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            primary: true,
            automaticallyImplyLeading: true,
            leading: null,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: creatIcon(
                          onTap: () {
                            setState(() {
                              setState(() {
                                isArabic = true;
                              });
                              print("isArabic after: $isArabic");
                              isArabic == false
                                  ? context
                                  .read<LanguageProvider>()
                                  .changeLanguage(EnglishLanguage: true)
                                  : context
                                  .read<LanguageProvider>()
                                  .changeLanguage(EnglishLanguage: false);
                            });
                            // RoutesManager.navigatorPush(context , HomeScreen());

                          },
                          child: SvgPicture.asset("assets/images/home.svg"
                            // color: mainColor,
                          )),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      child: creatIcon(
                        width: getSize(context: context).width*0.07,
                          onTap: () {
                            setState(() {
                              setState(() {
                                isArabic = false;
                              });
                              print("isArabic after: $isArabic");
                              isArabic == false
                                  ? context
                                  .read<LanguageProvider>()
                                  .changeLanguage(EnglishLanguage: true)
                                  : context
                                  .read<LanguageProvider>()
                                  .changeLanguage(EnglishLanguage: false);
                            });
                            // RoutesManager.navigatorPush(context , ChartScreen());
                          },
                          child: SvgPicture.asset(
                              "assets/images/chart.svg"
                            // color: mainColor,
                          )),
                    )
                  ],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  width: getSize(context: context).width * 0.27,
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    languageProvider!.getTexts( "guideUpdate"),
                    style: WhiteTitle.display5(context),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  /////// بتروح للدليل
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    textDirection: languageProvider!.isEnglish == true
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: getSize(context: context).height*0.038,
                        decoration: BoxDecoration(
                            color: mainColor,

                            borderRadius: BorderRadius.circular(10)
                        ),
                        width: getSize(context: context).width*0.09,
                        padding: EdgeInsets.all(7),
                        child: creatIcon(
                            onTap: () {},
                            child: SvgPicture.asset(
                                "assets/images/Path 496.svg"
                            )),
                      ),

                      Text(
                        languageProvider!.getTexts("guide"),
                        style: MainTitle.display5(context).copyWith(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
            ]));
  }

  Widget creatIcon({required void Function() onTap, required Widget child , double? width}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal:5),
          width: width??getSize(context: context).width * 0.05,
          // color: Colors.blue,
          child: child,
        ));
  }
}