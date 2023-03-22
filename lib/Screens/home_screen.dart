import 'package:family_tree/Screens/guide_screens/guide_screen.dart';
import 'package:family_tree/Screens/library_screen.dart';
import 'package:family_tree/Screens/nav_bar_screens/identity_screen.dart';
import 'package:family_tree/Screens/news_screens/all_news.dart';
import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';
import 'nasab_screen.dart';
import 'nav_bar_screens/mission_screen.dart';
import 'nav_bar_screens/setting_screen.dart';
import 'news_screens/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LanguageProvider? languageProvider;

  int index=0;
  bool? isArabic;

  List screens=[
    SizedBox(),
    IdentityScreen(),
    SettingScreen(),
    MissionScreen()
  ];
  @override
  void initState() {
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    return Scaffold(
      body: index==0? SafeArea(
        child: Directionality(
          textDirection: languageProvider!.isEnglish == false
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Center(
                    child: Text(
                      languageProvider!.getTexts("familyTree"),
                      style: MainTitle.display5(context)
                          .copyWith(fontSize: 28, color: const Color(0xff154C61)),
                    )),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getSize(context: context).width * 0.08),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                             RoutesManager.navigatorPush(context, LibraryScreen());
                            },
                            child: horizontalContainer(
                                image: "assets/images/folder-open.svg",
                                title: languageProvider!.getTexts("library")),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                           RoutesManager.navigatorPush(context, NewsScreen());
                          },
                          child: verticalContainer(
                              height: getSize(context: context).height * 0.14,
                              image: "assets/images/file-alt.svg",
                              title: languageProvider!.getTexts("news")),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:(){
                            RoutesManager.navigatorPush(context, GuideScreen());
                          },
                          child: verticalContainer(
                              size: 50,
                              fontSize: 20,
                              height: getSize(context: context).height * 0.28,
                              image: "assets/images/Path 496.svg",
                              title: languageProvider!.getTexts("guide"),
                              heightImage: 70),
                        ),
                        Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    RoutesManager.navigatorPush(context, NasabScreen());
                                  },
                                  child: horizontalContainer(
                                      image: "assets/images/sitemap.svg",
                                      title: languageProvider!.getTexts("nasab"),
                                      size: 60,
                                      fontSize: 25),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: verticalContainer(
                                            image: "assets/images/3 User.svg",
                                            title: languageProvider!.getTexts("characters"),
                                            size: 45,
                                            fontSize: 18)),
                                    Expanded(
                                        child: verticalContainer(
                                            image: "assets/images/tree.svg",
                                            title: languageProvider!.getTexts("tree"),
                                            size: 45,
                                            fontSize: 18)),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getSize(context: context).height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  designOne(
                    onTap: (){

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

                    },
                      image: "assets/images/Group 2963.svg",
                      title: languageProvider!.getTexts("contact"),
                      color: mainColor,
                      colorTitle: Colors.black),
                  designOne(
                      onTap: (){
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
                      },
                      image: "assets/images/bullseye.svg",
                      title: languageProvider!.getTexts("club"),
                      color: mainColor,
                      colorTitle: Colors.black),
                  designOne(
                      image: "assets/images/archive.svg",
                      title: languageProvider!.getTexts("box"),
                      color: mainColor,
                      colorTitle: Colors.black),
                ],
              ),
              SizedBox(
                height: getSize(context: context).height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "احمد",
                          style:
                          MainTitle.display5(context).copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("محمود محمد ابراهيم",
                            style: MainTitle.display5(context)
                                .copyWith(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Image.network(
                        "https://media.istockphoto.com/id/513472966/photo/young-arabian-man-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=r7ifk4l2pZWjjWEq09V1RmFFRdpudyATmCYhfOxFGxs=",
                        width: 100,
                        // color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ):screens[index],








      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: mainColor,
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.all(WhiteTitle.display5(context)),
          height: getSize(context: context).height*0.08,
        ),
        child: Directionality(
          textDirection: languageProvider!.isEnglish == false
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: NavigationBar(
            onDestinationSelected: (selectedIndex){
              setState(() {
                index=selectedIndex+1;
              });
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.perm_contact_cal_outlined , color: Colors.white,size: 28,), label: languageProvider!.getTexts("identity"),),
              NavigationDestination(icon: Icon(Icons.settings, color: Colors.white,size: 28,), label: languageProvider!.getTexts("setting")),
              NavigationDestination(icon: Icon(Icons.add_box_outlined, color: Colors.white,size: 28,), label: languageProvider!.getTexts("mission")),
            ],
          ),
        ),
      ),

    );
  }

  Widget verticalContainer({
    required String title,
    required String image,
    height,
    width,
    double? size,
    double? fontSize,
    double? heightImage,
  }) {
    return SizedBox(
      // padding: EdgeInsets.all(10),
      height: height ?? getSize(context: context).height * 0.14,
      width: width ?? getSize(context: context).width * 0.28,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              // height: 36,
              fit: BoxFit.cover,
              image,
              height: heightImage ?? 50,
            ),
            Text(
              title,
              style: WhiteTitle.display5(context)
                  .copyWith(fontSize: fontSize ?? 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget horizontalContainer({
    required String title,
    required String image,
    double? height,
    double? size,
    double? fontSize,
  }) {
    return SizedBox(
      height: height ?? getSize(context: context).height * 0.14,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: mainColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(image),
            Text(
              title,
              style: WhiteTitle.display5(context)
                  .copyWith(fontSize: fontSize ?? 20.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget designOne({
    required String title,
    required String image,
    double? size,
    Color? color,
    Color? colorTitle,
    double? fontSize,
     onTap,
  }) {
    return InkWell(
      onTap: onTap ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          Text(
            title,
            style: BlackLabel.display5(context).copyWith(
                fontSize: fontSize ?? 15, color: colorTitle ?? Colors.white),
          )
        ],
      ),
    );
  }
}
