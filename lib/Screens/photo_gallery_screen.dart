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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                    bottom: getSize(context: context).height * 0.03),
                child: CreatTextField(
                  width: double.infinity,
                  onSubmit: (value){},
                  fillColor: secColor,
                  label:"البحث",
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: getSize(context: context).height * 0.03),
                child: Text("2022/02/10" , style: BlackTitle.display5(context),),),

              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset("assets/images/testt.png"),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        height: 50,
                        child: Text("زيارده جده 1444" , style: WhiteTitle.display5(context),),
                      )
                    ],
                  )


                )
            ],
          )
        ),

    );
  }
}
