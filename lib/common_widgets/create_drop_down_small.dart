import 'package:family_tree/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../utilities/text_style.dart';

class CreateDropDownSmall extends StatefulWidget {
  const CreateDropDownSmall({Key? key}) : super(key: key);

  @override
  State<CreateDropDownSmall> createState() => _CreateDropDownSmallState();
}

class _CreateDropDownSmallState extends State<CreateDropDownSmall> {

  LanguageProvider? languageProvider;

  List genderList=[];
  bool visibility=false;
  String? genderName;

  @override
  void initState() {

    languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    genderList=[
      languageProvider!.getTexts("male"),
      languageProvider!.getTexts("female")
    ];
    genderName=languageProvider!.getTexts("gender");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: getSize(context: context).width*0.24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  visibility=!visibility;
                });
              },
              child: Container(
                  width: getSize(context: context).width*0.24,

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
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        width: getSize(context: context).width*0.11,
                        child: Text(
                           genderName?? languageProvider!.getTexts("gender"),
                          style: WhiteLabel.display5(context).
                          copyWith(fontSize: 14 ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: getSize(context: context).width*0.02,),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 28,
                        color: mainColor,
                      ),
                    ],
                  )),
            ),

            Visibility(
              visible: visibility,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: greyColor,
                    ),
              child: Column(
                  children: List.generate(2, (index) =>
                      InkWell(
                        onTap: (){
                          if(index==0){
                            setState(() {
                              genderName=genderList[index];
                            });
                          }else{
                            setState(() {
                              genderName=genderList[index];
                            });
                          }
                          setState(() {
                            visibility=!visibility;
                          });
                        },
                        child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                        Text(genderList[index], style: MainTitle.display5(context).copyWith(fontSize: 13)),
                        index==0?SizedBox(height: 8,):SizedBox(),
                    index==1?SizedBox(): Divider(color: mainColor,height: 1,indent: 10,endIndent: 10,),
                        index==1?SizedBox(height: 5,):SizedBox(),
                    ],
                  ),
                ),
                      )



                  )
              )
            )
            )
          ],
        ),
      ),
    );
  }
}
