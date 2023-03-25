import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../app_manager/local_data.dart';
import '../../common_widgets/creat_app_bar.dart';
import '../../common_widgets/creat_text_field.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';

class MawaledScreen extends StatefulWidget {

  @override
  State<MawaledScreen> createState() => _MawaledScreenState();
}

class _MawaledScreenState extends State<MawaledScreen> {
  LanguageProvider? languageProvider;

  @override
  void initState() {

    languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return  Scaffold(
      appBar: CreatAppBar(
        hasBackButton: false,
        icon: 'assets/images/sitemap.svg',
        iconTitle: languageProvider!.getTexts("births"),
        onIconPressed: () {}, hasBirths: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Directionality(
            textDirection: languageProvider!.isEnglish == false
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: getSize(context: context).height*0.02,),
                Card(
                  elevation: 5,
                  color: greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child:  Container(
                    padding: EdgeInsets.all(7),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(languageProvider!.getTexts("review"), style: WhiteTitle.display5(context),),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward_ios_outlined, size: 18,color: Colors.white,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: getSize(context: context).height*0.03,),
                Text("استمارة اخبار المواليد. إرسالك لأي موضوع في هذا القسم هو موافقتك على نشره في تطبيق الاسرة",
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: getSize(context: context).height*0.03,),
                Card(
                  elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 5,),
                      Text("معلومات الوالدين" ,
                        style: MainLabel.display5(context),),
                      SizedBox(height: 5,),
                      Text("الرجاء إختيار والد او والدة الطفل من الدليل" ,
                        style: BlackLabel.display5(context).copyWith(color: Colors.black),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10,),
                        // Align(
                        //   alignment: Alignment.bottomCenter,
                        //   child: SvgPicture.asset(
                        //     height: 20,
                        //       "assets/images/exit.svg",
                        //       alignment: Alignment.center),
                        // ),
                        Column(
                          children: [
                            SizedBox(height: getSize(context: context).height*0.01,),
                            FaIcon(FontAwesomeIcons.remove,size: 20,color: Colors.red,),
                            // FaIcon(FontAwesomeIcons.remove,size: 25),
                          ],
                        ),
                        Expanded(
                          child: CreatTextField(
                            isContact: true,
                            height: getSize(context: context).height*0.04,
                            fillColor: greyColor,
                            label: "اضفط",
                            labelStyle: WhiteTitle.display5(context),
                            suffixIcon: InkWell(
                              onTap: (){
                                print("Dddddddddd");
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: mainColor2,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft:languageProvider!.isEnglish==true?
                                      Radius.circular(0):Radius.circular(5),
                                      topLeft: languageProvider!.isEnglish==true?
                                      Radius.circular(0):Radius.circular(5),
                                      bottomRight:languageProvider!.isEnglish==true?
                                      Radius.circular(5):Radius.circular(0),

                                      topRight: languageProvider!.isEnglish==true?
                                      Radius.circular(5):Radius.circular(0),
                                    )
                                ),
                                child: SvgPicture.asset("assets/images/choose.svg"),
                              ),
                            ),

                          ),
                        ),

                      ],
                    ),
                      SizedBox(height: getSize(context: context).height*0.01,),


                    ],
                  ),
                ),

                ),
                SizedBox(height: getSize(context: context).height*0.03,),

                Card(
                  elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 5,),
                      Text("معلومات الام" ,
                        style: MainLabel.display5(context).copyWith(color: Colors.black),),
                      SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10,),

                        Column(
                          children: [
                            SizedBox(height: getSize(context: context).height*0.01,),
                            FaIcon(FontAwesomeIcons.remove,size: 20,color: Colors.red,),
                          ],
                        ),
                        Expanded(
                          child: CreatTextField(
                            isContact: true,
                            height: getSize(context: context).height*0.04,
                            fillColor: greyColor,
                            label: "اضفط",
                            labelStyle: WhiteTitle.display5(context),
                            suffixIcon: InkWell(
                              onTap: (){
                                print("Dddddddddd");
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: mainColor2,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft:languageProvider!.isEnglish==true?
                                      Radius.circular(0):Radius.circular(5),
                                      topLeft: languageProvider!.isEnglish==true?
                                      Radius.circular(0):Radius.circular(5),
                                      bottomRight:languageProvider!.isEnglish==true?
                                      Radius.circular(5):Radius.circular(0),

                                      topRight: languageProvider!.isEnglish==true?
                                      Radius.circular(5):Radius.circular(0),
                                    )
                                ),
                                child: SvgPicture.asset("assets/images/choose.svg"),
                              ),
                            ),

                          ),
                        ),

                        SizedBox(height: 10,),

                      ],
                    ),
                      SizedBox(height: getSize(context: context).height*0.03,),

                      Text("في حالة عدم وجود اسم الأم في القائمة يرجى الإبلاغ من خلال ايقونه تواصل",
                        textAlign: TextAlign.end,
                      ),

                      SizedBox(height: getSize(context: context).height*0.04,),

                      Center(
                        child:
                        Column(
                          children: [
                            MaterialButton(shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                              minWidth: 20,color: greyColor, onPressed: (){},
                              child: SvgPicture.asset("assets/images/contact.svg"),),
                            Text(languageProvider!.getTexts("contact") ,
                              style: MainLabel.display5(context),)
                          ],
                        )
                      )
                    ],
                  ),
                ),

                ),

              customBaby(title: "الاول", onChild: false),
              customBaby(title: "الاول", onChild: true),
              // customBaby(title: "التاني"),



                Card(
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 5,),
                        Text("معلومات الاب" ,
                          style: MainLabel.display5(context),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              color:thirdColor,
                                onPressed: (){}, child:
                              Row(
                                children: [
                                  Text("من داخل الاسره" , style: WhiteTitle.display5(context),),
                                  Icon(Icons.add , color: Colors.white,)
                                ],
                              )

                              ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              color:thirdColor,
                                onPressed: (){}, child:
                              Row(
                                children: [
                                  Text("من داخل الاسره" , style: WhiteTitle.display5(context),),
                                  Icon(Icons.add, color: Colors.white,)
                                ],
                              )

                              ),
                          ]
                        ),
                        SizedBox(height: getSize(context: context).height*0.01,),


                      ],
                    ),
                  ),

                ),


                SizedBox(height: getSize(context: context).height*0.03,),

              ]
            ),
          ),
        ),
      ),
    );
  }

  Widget containerCustom(){
    return    Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: getSize(context: context).height * 0.05,
        decoration: BoxDecoration(
          border: Border.all(width: 0.7,color: mainColor),
            color: greyColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text("gfh" , style: MainLabel.display5(context),)),
      ),
    );
  }

  Widget customBaby({
    required bool onChild,
  required String title
}){
    return Card(
        elevation: 2,
        child: Container(
        padding: EdgeInsets.all(10),
          width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            onChild==true?SizedBox():  Text("المولود ${title}" , style: MainTitle.display5(context).copyWith(color: mainColor2),),
            SizedBox(height: 5,),
            InkWell(
              onTap: (){},
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.7,color: mainColor),

                    borderRadius: BorderRadius.circular(6),
                    color: greyColor,
                  ),
                  padding: EdgeInsets.all(3),
                  child: Row(
                    textDirection: languageProvider!.isEnglish == true
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        "الجنس",
                        style: WhiteLabel.display5(context).
                        copyWith(fontSize: 14 ),
                      ),
                      SizedBox(width: getSize(context: context).width*0.03,),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 28,
                        color: mainColor,
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 10,),
            Text("اسم المولود رباعي" , style: MainLabel.display5(context).copyWith(color: mainColor),),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10,),
                containerCustom(),
                SizedBox(width: 10,),

                containerCustom(),
                SizedBox(width: 10,),

                containerCustom(),
                SizedBox(width: 10,),
                Expanded(child: CreatTextField(
                  label: "الاسم الاول",
                  labelStyle: MainLabel.display5(context).copyWith(fontSize: 10),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

}
