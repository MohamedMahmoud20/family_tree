import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_manager/local_data.dart';
import '../common_widgets/creat_text_field.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:   SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),

            child: ListView(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: CreatTextField(
                    width: double.infinity,
                    onSubmit: (value){},
                    fillColor: secColor,
                    label:"البحث",
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
