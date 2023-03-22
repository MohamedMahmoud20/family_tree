import 'package:family_tree/common_widgets/creat_text_field.dart';
import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../app_manager/local_data.dart';
import '../../common_widgets/creat_search.dart';
import '../../common_widgets/create_app_bar_guide.dart';
import '../../providers/language_provider.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  LanguageProvider? languageProvider;

  List counter = [0, 1, 2];
  List? categoriesName= [
    "death",
    "all",
    "alive",
  ];
  List icons = [
    "person",
    "spider",
    "person",
  ];
  List iconsSelect = [
    "person2",
    "spider2",
    "person2",
  ];

  @override
  void initState() {
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);


    super.initState();
  }

  int selectedIndex = 1;
  int? selectedIconIndex;
  bool buttonSelected = false;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      appBar: CreatAppBarGuide(),
      body: Directionality(
        textDirection: languageProvider!.isEnglish == true
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                height: getSize(context: context).height * 0.07,
                child: Row(
                  textDirection: languageProvider!.isEnglish == false
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.5, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        height: getSize(context: context).height * 0.048,
                        onPressed: () {},
                        child: Text(
                          "3715",
                          style: MainTitle.display5(context)
                              .copyWith(fontSize: 20, color: mainColor2),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: getSize(context: context).height * 0.048,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: greyColor),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            languageProvider!.getTexts("allBranch"),
                            style: MainLabel.display5(context)
                                .copyWith(color: mainColor2),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                            color: mainColor2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: CreatSearch(
                          width: double.infinity,
                          onSubmit: (value) {},
                          fillColor: secColor,
                          label: languageProvider!.getTexts("search"),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            buttonSelected = !buttonSelected;
                          });
                        },
                        icon: Icon(
                          buttonSelected == true
                              ? Icons.filter_alt
                              : Icons.filter_alt_outlined,
                          size: 35,
                          color: mainColor2,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: getSize(context: context).height * 0.01,
              ),
              Row(
                textDirection: languageProvider!.isEnglish == false
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: List.generate(
                        categoriesName!.length,
                        (index) => chooseCategory(
                            color:
                                selectedIndex == index ? mainColor2 : greyColor,
                            colorTitle: selectedIndex == index
                                ? Colors.white
                                : mainColor2,
                            title: languageProvider!.getTexts(categoriesName![index]),
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(children: List.generate(3, (index) => iconDesign(
                        colorBackground: selectedIconIndex == index
                            ? counter[index] == index ? mainColor2 : Colors.transparent : Colors.transparent,
                        image: selectedIconIndex == index ? counter[index] == index ? iconsSelect[index] : icons[index] : icons[index],
                        onTap: () {
                          Color color = selectedIconIndex == index ? counter[index] == index ? mainColor2 : Colors.transparent : Colors.transparent;
                          setState(() {
                            selectedIconIndex = index;
                          });
                          counter[index] == index && color == mainColor2 ? counter[index]-- : counter[index] = index;
                        },
                        height: index == 1 ? getSize(context: context).height * 0.03
                            : getSize(context: context).height * 0.035),)),
                ],
              ),
              buttonSelected == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textField(label: languageProvider!.getTexts("grand")),
                        textField(label: languageProvider!.getTexts("sonOrcousin")),
                        textField(label: languageProvider!.getTexts("brotherOrSister")),
                        textField(label: languageProvider!.getTexts("son")),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: getSize(context: context).height * 0.02),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  height:
                                      getSize(context: context).height * 0.08,
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
                                      Stack(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: getSize(context: context)
                                                    .height *
                                                0.03,
                                            width: getSize(context: context)
                                                    .width *
                                                0.2,
                                            alignment: Alignment.centerLeft,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xffE9E9E9),
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "0012",
                                              style:
                                                  BlackLabel.display5(context),
                                            ),
                                          ),
                                          Container(
                                            height: getSize(context: context)
                                                    .height *
                                                0.03,
                                            width: getSize(context: context)
                                                    .width *
                                                0.2 *
                                                0.4,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              "أس",
                                              style:
                                                  BlackLabel.display5(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height:
                                            getSize(context: context).height *
                                                0.03,
                                        width: getSize(context: context).width *
                                            0.1,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xff18B566),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          "10",
                                          style: BlackLabel.display5(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    " هبد العزبز خالد احمد",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: BlackTitle.display5(context),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconDesign({image, height, color, colorBackground, required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: getSize(context: context).height * 0.05,
        decoration: BoxDecoration(
            color: colorBackground, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: SvgPicture.asset(
          "assets/images/$image.svg",
          color: color,
          height: height ?? getSize(context: context).height * 0.04,
        ),
      ),
    );
  }

  Widget chooseCategory({
    required String title,
    required onTap,
    color,
    colorTitle,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyColor,
        ),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              title,
              style: MainLabel.display5(context).copyWith(color: colorTitle),
            )),
      ),
    );
  }

  Widget textField({required label}) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: CreatTextField(
              labelStyle: MainLabel.display5(context).copyWith(fontSize: 9),
              titleStyle: MainLabel.display5(context).copyWith(fontSize: 10),
              label: label,
            )));
  }
}
