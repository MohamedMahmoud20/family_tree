import 'package:family_tree/Screens/home_screen.dart';
import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../app_manager/local_data.dart';
import '../../providers/language_provider.dart';
import 'all_news.dart';
import 'b.dart';
import 'c.dart';
import 'd.dart';
import 'e.dart';
import 'f.dart';

class NewsScreen extends StatefulWidget {
  // NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

enum NewsPages { AllNews, B, C, D, E, F }

class _NewsScreenState extends State<NewsScreen> {
  LanguageProvider? languageProvider;
  NewsPages? newsPages;

  @override
  void initState() {
    // TODO: implement initState /////////////////////////// متنساش الخلفيه
    newsPages = NewsPages.AllNews;
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.back_hand , color: Colors.transparent,),
          backgroundColor: Colors.transparent,
          elevation: 0,

          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 12),
              child: creatIcon(onTap: () {
                RoutesManager.navigatorAndRemove(context, HomeScreen());
              },
                  child: SvgPicture.asset(
                    "assets/images/home.svg",
                    color: mainColor,
                  )
              ),
            ),
            Spacer(),

            Container(
              child: creatIcon(
                  onTap: () {
                    setState(() {
                      newsPages = NewsPages.F;
                    });
                    print("FFFFFFFFFFFFFFFFFFFf");
                  },
                  child: SvgPicture.asset(
                    "assets/images/menu.svg",
                    // color: mainColor,
                  )
                  //   child: SvgPicture.asset(
                  // image,
                  // color: mainColor,
                  // )
                  ),
            ),
            Container(
              child: creatIcon(
                  onTap: () {
                    setState(() {
                      newsPages = NewsPages.E;
                    });
                    print("EEEEEEEEEEEEEEEEEEEE");
                  },
                  child: SvgPicture.asset(
                "assets/images/menu.svg",
                // color: mainColor,
                )
                  ),
            ),
            Container(
              child: creatIcon(
                  onTap: () {
                    setState(() {
                      newsPages = NewsPages.D;
                    });
                    print("DDDDDDDDDDDDDDDDDDD");
                  },
                  child: SvgPicture.asset(
                "assets/images/menu.svg",
                // color: mainColor,
                )
                  ),
            ),
            Container(
              child: creatIcon(
                  onTap: () {
                    setState(() {
                      newsPages = NewsPages.C;
                    });
                    print("CCCCCCCCCCCCCCc");
                  },
                  child: SvgPicture.asset(
                "assets/images/menu.svg",
                // color: mainColor,
                )
                  ),
            ),
            Container(
              child: creatIcon(
                  onTap: () {
                    setState(() {
                      newsPages = NewsPages.B;
                    });
                    print("BBBBBBBBBBBBBb");
                  },
                  child: SvgPicture.asset(
                "assets/images/menu.svg",
                // color: mainColor,
                )
                  ),
            ),
            Container(
              child: creatIcon(
                  onTap: () {
                    setState(() {
                      newsPages = NewsPages.AllNews;
                    });
                    print("AAAAAAAAAAAAAAaa");
                  },
                  child: SvgPicture.asset(
                "assets/images/menu.svg",
                // color: mainColor,
                )
                  ),
            ),
          ],
        ),
        body: newsPages == NewsPages.AllNews
            ? AllNews()
            : newsPages == NewsPages.B
                ? B()
                : newsPages == NewsPages.C
                    ? C()
                    : newsPages == NewsPages.D
                        ? D()
                        : newsPages == NewsPages.E
                            ? E()
                            : newsPages == NewsPages.F
                                ? F()
                                : SizedBox());
  }

  Widget creatIcon({required void Function() onTap, required Widget child}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: getSize(context: context).width * 0.06,
          // color: Colors.blue,
          child: child,
        ));
  }
}
