import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../common_widgets/creat_app_bar.dart';
import '../common_widgets/creat_search.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  LanguageProvider? languageProvider;
  List names = [
    "ابراهيم السيد",
    "احمد مجدي",
    "عبد السلام محمود",
    "محمد محمود محمد",
    "ابراهيم السيد",
    "احمد مجدي",
    "عبد السلام محمود",
    "محمد محمود محمد",
    "ابراهيم السيد",
    "احمد مجدي",
    "عبد السلام محمود",
    "محمد محمود محمد",
    "ابراهيم السيد",
    "احمد مجدي",
    "عبد السلام محمود",
    "محمد محمود محمد",
  ];

  List visibleList = [];

  bool visible = false;

  @override
  void initState() {
    names.forEach((element) {
      visibleList.add(false);
    });
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      appBar: CreatAppBar(
        hasBackButton: false,
        icon: 'assets/images/3 User.svg',
        iconTitle: languageProvider!.getTexts("characters"),
        onIconPressed: () {},
      ),
      body: Directionality(
        textDirection: languageProvider!.isEnglish == true
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: CreatSearch(
                  width: double.infinity,
                  onSubmit: (value) {},
                  fillColor: secColor,
                  label: languageProvider!.getTexts("search"),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: MaterialButton(
                    minWidth: 60,
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                    child: Text(
                      languageProvider!.getTexts("instructionsAndAlerts"),
                      style:
                          WhiteTitle.display5(context).copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return dropDownButton(
                        objectOfData: names,
                        title: "من اعيان الاسره",
                        visibleData: visibleList[index],
                        onTap: () {
                          setState(() {
                            visibleList[index] = !visibleList[index];
                          });
                        });
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  dropDownButton({
    required String title,
    required bool visibleData,
    objectOfData,
    void Function()? onTap,
  }) {
    return Column(
      children: [
        Text(
          "${languageProvider!.getTexts("familyAffairs") + " - " + title}",
          style: BlackTitle.display5(context).copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: mainColor2,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: WhiteTitle.display5(context).copyWith(fontSize: 16),
                  ),
                  Icon(
                    visible == true
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              )),
        ),
        Visibility(
          visible: visibleData,
          child: Container(
            height: getSize(context: context).height * 0.2,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              itemCount: objectOfData.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: getSize(context: context).height * 0.08,
                              width: getSize(context: context).width * 0.15,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/testt.png"),
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.redAccent.withOpacity(0.85),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        )),
                                    child: Text(
                                      "أس",
                                      style: BlackLabel.display5(context),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffE9E9E9), width: 1),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        )),
                                    child: Text(
                                      "0012",
                                      style: BlackLabel.display5(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Text(
                                objectOfData[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: BlackTitle.display5(context),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: greyColor,
                      endIndent: 50,
                      indent: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
