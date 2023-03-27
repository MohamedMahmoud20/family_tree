import 'package:family_tree/common_widgets/create_button2.dart';
import 'package:family_tree/common_widgets/create_choose_from_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../app_manager/local_data.dart';
import '../../common_widgets/creat_app_bar.dart';
import '../../common_widgets/creat_text_field.dart';
import '../../common_widgets/create_drop_down_small.dart';
import '../../providers/language_provider.dart';
import '../../utilities/text_style.dart';

class BirthsScreen extends StatefulWidget {

  @override
  State<BirthsScreen> createState() => _BirthsScreenState();
}

class _BirthsScreenState extends State<BirthsScreen> {
  LanguageProvider? languageProvider;

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
                CreateButton2(isIcon: true,),
                SizedBox(height: getSize(context: context).height*0.03,),
                Text(languageProvider!.getTexts("birthNewsForm"),
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
                      Text(languageProvider!.getTexts("parentInfo") ,
                        style: MainLabel.display5(context),),
                      SizedBox(height: 5,),
                      Text(languageProvider!.getTexts("chooseParent"),
                        style: BlackLabel.display5(context).copyWith(color: Colors.black),),
                    CreateChooseFromContact(),
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
                      Text(languageProvider!.getTexts("motherInfo") ,
                        style: MainLabel.display5(context).copyWith(color: Colors.black),),
                      SizedBox(height: 5,),
                      CreateChooseFromContact(),
                      SizedBox(height: getSize(context: context).height*0.03,),

                      Text(languageProvider!.getTexts("pressContact"),
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
                        Text(languageProvider!.getTexts("fatherInfo") ,
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
                                  Text(languageProvider!.getTexts("outsideFamily") ,
                                    style: WhiteTitle.display5(context),),
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
                                  Text(languageProvider!.getTexts("insideFamily") ,
                                    style: WhiteTitle.display5(context),),
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
        height: getSize(context: context).height * 0.04,
        decoration: BoxDecoration(
          border: Border.all(width: 0.7,color: mainColor),
            color: greyColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text("محمد" , style: MainLabel.display5(context),)),
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
            CreateDropDownSmall(),
            SizedBox(height: getSize(context: context).height * 0.008,),
            Text(languageProvider!.getTexts("babyName") , style: MainLabel.display5(context).copyWith(color: mainColor),),
            SizedBox(height: getSize(context: context).height * 0.008,),
            Row(
              children: [
                SizedBox(width: getSize(context: context).height * 0.01,),
                containerCustom(),
                SizedBox(width: getSize(context: context).height * 0.01,),

                containerCustom(),
                SizedBox(width: getSize(context: context).height * 0.01,),

                containerCustom(),
                SizedBox(width: getSize(context: context).height * 0.01,),
                Expanded(child: CreatTextField(
                  height: getSize(context: context).height * 0.04,
                  label: languageProvider!.getTexts("firstName"),
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
