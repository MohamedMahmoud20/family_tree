import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../common_widgets/creat_app_bar.dart';
import '../common_widgets/creat_search.dart';
import '../common_widgets/creat_text_field.dart';
import '../providers/language_provider.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
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
      appBar: CreatAppBar(hasBackButton:true,
        icon: 'assets/images/photo.svg', iconTitle: languageProvider!.getTexts("gallery"), onIconPressed: () {  },
      ),
      body:   SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),

            child: ListView(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: CreatSearch(
                    width: double.infinity,
                    onSubmit: (value){},
                    fillColor: secColor,
                    label:languageProvider!.getTexts("search"),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int indexParent) {
                  return  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                        top: getSize(context: context).height * 0.02,
                            bottom: getSize(context: context).height * 0.02),
                        child: Text("2022/02/1${indexParent}" , style: BlackTitle.display5(context),),),

                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8, crossAxisCount: 3,),

                        itemBuilder: (BuildContext context, int index) {
                          return  Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset("assets/images/testt.png" , fit: BoxFit.cover,height: double.infinity,),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: mainColor,
                                    ),
                                    height: 35,
                                    child: Text("زياره جده 1444 م " , style: WhiteTitle.display5(context),),
                                  )
                                ],
                              )


                          );
                        },)
                    ],
                  );
                },)
              ],
            ),
          )
        ),

    );
  }
}
