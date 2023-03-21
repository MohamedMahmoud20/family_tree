import 'package:family_tree/Screens/nav_bar_screens/identity_screen.dart';
import 'package:family_tree/Screens/news_screens/all_news.dart';
import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_manager/local_data.dart';
import '../utilities/text_style.dart';
import 'nav_bar_screens/mission_screen.dart';
import 'nav_bar_screens/setting_screen.dart';
import 'news_screens/news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index=0;

  List screens=[
    SizedBox(),
    IdentityScreen(),
    SettingScreen(),
    MissionScreen()
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index==0? SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Center(
                  child: Text(
                    "شجرة الأسرة",
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
                        child: horizontalContainer(
                            image: "assets/images/folder-open.svg",
                            title: "المكتبه"),
                      ),
                      InkWell(
                        onTap: (){
                         RoutesManager.navigatorPush(context, NewsScreen());
                        },
                        child: verticalContainer(
                            height: getSize(context: context).height * 0.14,
                            image: "assets/images/file-alt.svg",
                            title: "الاخبار"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalContainer(
                          size: 50,
                          fontSize: 20,
                          height: getSize(context: context).height * 0.28,
                          image: "assets/images/Path 496.svg",
                          title: "الدليل",
                          heightImage: 70),
                      Expanded(
                          child: Column(
                            children: [
                              horizontalContainer(
                                  image: "assets/images/sitemap.svg",
                                  title: "النسب",
                                  size: 60,
                                  fontSize: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: verticalContainer(
                                          image: "assets/images/3 User.svg",
                                          title: "الشخصيات",
                                          size: 45,
                                          fontSize: 18)),
                                  Expanded(
                                      child: verticalContainer(
                                          image: "assets/images/tree.svg",
                                          title: "الشجره",
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
                    image: "assets/images/Group 2963.svg",
                    title: "تواصل",
                    color: mainColor,
                    colorTitle: Colors.black),
                designOne(
                    image: "assets/images/bullseye.svg",
                    title: "النادي",
                    color: mainColor,
                    colorTitle: Colors.black),
                designOne(
                    image: "assets/images/archive.svg",
                    title: "الصندوق",
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
      ):screens[index],








      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: mainColor,
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.all(WhiteTitle.display5(context)),
          height: getSize(context: context).height*0.08,
        ),
        child: NavigationBar(
          onDestinationSelected: (selectedIndex){
            setState(() {
              index=selectedIndex+1;
            });
          },
          destinations:const [
            NavigationDestination(icon: Icon(Icons.perm_contact_cal_outlined , color: Colors.white,size: 28,), label: "الهويه",),
            NavigationDestination(icon: Icon(Icons.settings, color: Colors.white,size: 28,), label: "الاعدادات"),
            NavigationDestination(icon: Icon(Icons.add_box_outlined, color: Colors.white,size: 28,), label: "المهام"),
          ],
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
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(image),
        Text(
          title,
          style: BlackLabel.display5(context).copyWith(
              fontSize: fontSize ?? 15, color: colorTitle ?? Colors.white),
        )
      ],
    );
  }
}
