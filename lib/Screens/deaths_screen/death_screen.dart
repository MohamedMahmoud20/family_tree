import 'package:family_tree/app_manager/local_data.dart';
import 'package:family_tree/common_widgets/creat_app_bar.dart';
import 'package:family_tree/common_widgets/create_drop_down_small.dart';
import 'package:family_tree/providers/language_provider.dart';
import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/creat_text_field.dart';
import '../../common_widgets/create_button2.dart';
import '../../common_widgets/create_choose_from_contact.dart';

class DeathsScreen extends StatefulWidget {
  const DeathsScreen({Key? key}) : super(key: key);

  @override
  State<DeathsScreen> createState() => _DeathsScreenState();
}

class _DeathsScreenState extends State<DeathsScreen> {
  LanguageProvider? languageProvider;

  bool inside=false;
  bool outside=false;

  List<TextEditingController> controller=[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

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
        iconTitle: languageProvider!.getTexts("deaths"),
        onIconPressed: () {}, hasBirths: true,
      ),
      body:Directionality(
        textDirection: languageProvider!.isEnglish == false
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: getSize(context: context).width*0.045),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric( vertical: getSize(context: context).height*0.03),
                child: Row(
                  children: [
                    CreateButton2(
                      color: Colors.red,
                      title: languageProvider!.getTexts("close"),
                    ),
                    Spacer(),
                    CreateButton2(
                      color: mainColor,
                      isIcon: true,
                      title: languageProvider!.getTexts("next"),
                    ),
                  ],
                ),
              ),

              Text(languageProvider!.getTexts("deathNewsForm"),
                textAlign: TextAlign.end,
                style: BlackLabel.display5(context).copyWith(color: Colors.black),
              ),

              SizedBox(height:  getSize(context: context).height*0.03,),
              Card(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10,),
                      Text(languageProvider!.getTexts("infoDeath") ,
                        style: MainLabel.display5(context),
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(height: 10,),
                      Text(languageProvider!.getTexts("infoDeath2") ,
                          textAlign: TextAlign.end,
                        style: BlackLabel.display5(context).copyWith(color: Colors.black),),
                      SizedBox(height:  getSize(context: context).height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          choose(
                            onTap: (){
                              setState(() {
                                outside=!outside;
                                if(outside==true){
                                  inside=false;
                                }
                              });
                            },
                            padding: getSize(context: context).height*0.01,
                            height: getSize(context: context).height*0.015,
                            context: context,
                            color:outside==true? mainColor:Colors.white,
                            colorIcon: outside==false? mainColor:Colors.white,
                            image: "assets/images/edit.svg",
                              title: languageProvider!.getTexts("outsideFamily")
                          ),
                          choose(
                              onTap: (){
                                setState(() {
                                  inside=!inside;
                                  if(inside==true){
                                    outside=false;
                                  }
                                });
                              },
                              context: context,
                              color:inside==true? mainColor:Colors.white,
                              colorIcon: inside==false? mainColor:Colors.white,
                            image: "assets/images/choose.svg",
                            title: languageProvider!.getTexts("insideFamily")
                          ),
                          SizedBox()
                        ],
                      ),

                      SizedBox(height:  getSize(context: context).height*0.02,),
                      inside==true?  CreateChooseFromContact():SizedBox(),

                      outside==true?
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CreateDropDownSmall()
                                ,SizedBox(height: 15,),
                                Text(languageProvider!.getTexts("infoDeath") ,
                                  style: MainLabel.display5(context),
                                  textAlign: TextAlign.end,
                                ),
                                Row(
                                  children: List.generate(3, (index) => Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Expanded(child: CreatTextField(
                                          controller: controller[index],
                                          height: getSize(context: context).height * 0.04,
                                          label: languageProvider!.getTexts("firstName"),
                                          labelStyle: MainLabel.display5(context).copyWith(fontSize: 10),
                                        )),
                                      ],
                                    ),
                                  ),),
                                )
                              ],
                            ),
                          )

                          :SizedBox(),
                      SizedBox(height: getSize(context: context).height*0.01,),


                    ],
                  ),
                ),

              ),
            ],
          ),
        ),
      )
    );
  }


}

Widget choose({
  required String? title,
  required String? image,
  required Color? color,
   Color? colorIcon,
  required context,
  double? padding,
  double? height,
  void Function()? onTap
}){

  return   Row(
    children: [
      Text(title! , style: MainTitle.display5(context),),
      InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(padding??getSize(context: context).width*0.025),
            margin: EdgeInsets.symmetric(horizontal: getSize(context: context).width*0.03),
            decoration: BoxDecoration(
                color: color??mainColor,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: mainColor)
            ),
            child: SvgPicture.asset(image!, height: height??20,color: colorIcon??mainColor,)),
      )
    ],
  );

}
