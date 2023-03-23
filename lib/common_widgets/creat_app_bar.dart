import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../Screens/home_screen.dart';
import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

class CreatAppBar extends StatefulWidget with PreferredSizeWidget {
  final String icon;
  final String iconTitle;
  final Size preferredSize;
  final bool hasBackButton;
  final void Function() onIconPressed;

  CreatAppBar(
      {Key? key,
        required this.icon,
        required this.hasBackButton,
        required this.iconTitle,
        required this.onIconPressed})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  State<CreatAppBar> createState() => _CreatAppBarState();
}

class _CreatAppBarState extends State<CreatAppBar> {

  bool? isArabic;
  LanguageProvider? languageProvider;

  @override
  void initState() {
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    isArabic = !languageProvider!.isEnglish;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
        textDirection: languageProvider!.isEnglish == true
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:  getSize(context: context).width*0.02,),
          child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              primary: true,
              automaticallyImplyLeading: true,
              leading: null,
              actions: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:getSize(context: context).width*0.03,),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: creatIcon(
                            onTap: () {
                              RoutesManager.navigatorAndRemove(context, HomeScreen());
                            },
                            child: SvgPicture.asset("assets/images/home.svg"
                              // color: mainColor,
                            )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      widget.hasBackButton == true
                          ? Container(
                        width: 50,
                        child: creatIcon(
                            onTap: () {
                              RoutesManager.pop(context);
                            },
                            child: SvgPicture.asset("assets/images/back.svg"
                              // color: mainColor,
                            )),
                      )
                          : SizedBox()
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: widget.onIconPressed,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      textDirection: languageProvider!.isEnglish == true
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: [
                        Container(
                          height: getSize(context: context).height*0.038,
                          decoration: BoxDecoration(
                              color: mainColor,

                              borderRadius: BorderRadius.circular(10)
                          ),
                          width: getSize(context: context).width*0.09,
                          padding: EdgeInsets.all(7),
                          child: creatIcon(
                              onTap: () {
                                setState(() {
                                  isArabic = !isArabic!;
                                });
                                print("isArabic after: $isArabic");
                                isArabic == false
                                    ? context
                                    .read<LanguageProvider>()
                                    .changeLanguage(EnglishLanguage: true)
                                    : context
                                    .read<LanguageProvider>()
                                    .changeLanguage(EnglishLanguage: false);
                              },
                              child: SvgPicture.asset(
                                widget.icon,
                                // color: mainColor,
                              )),
                        ),
                        SizedBox(
                          width: getSize(context: context).width*0.03,
                        ),
                        Text(
                          widget.iconTitle,
                          style: MainTitle.display5(context),
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ));
  }

  Widget creatIcon({required void Function() onTap, required Widget child}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal:5),
          width: getSize(context: context).width * 0.05,
          // color: Colors.blue,
          child: child,
        ));
  }
}
