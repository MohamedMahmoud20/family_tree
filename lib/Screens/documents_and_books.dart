import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_manager/local_data.dart';
import '../common_widgets/creat_app_bar.dart';
import '../common_widgets/creat_search.dart';
import '../common_widgets/creat_text_field.dart';

class DocumentsAndBooks extends StatefulWidget {
  const DocumentsAndBooks({Key? key}) : super(key: key);

  @override
  State<DocumentsAndBooks> createState() => _DocumentsAndManuscripts();
}

class _DocumentsAndManuscripts extends State<DocumentsAndBooks> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CreatAppBar(hasBackButton:true,
        icon: 'assets/images/book.svg', iconTitle: "الوثائق والمخطوطات", onIconPressed: () {  },
      ),
      body:   SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),

              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: CreatSearch(
                    width: double.infinity,
                    onSubmit: (value){},
                    fillColor: secColor,
                    label:"البحث",
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8, crossAxisCount: 3,mainAxisExtent: 220),

                  itemBuilder: (BuildContext context, int index) {

                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 8),
                          alignment: Alignment.center,

                          child: Text("مختصر دراسة للتاريخ" ,textAlign: TextAlign.end, style: BlackLabel.display5(context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis
                            ,),
                        ),
                        Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset("assets/images/testt.png" , fit: BoxFit.cover,height: 170,),
                            ))
                      ],
                    );
                  },),
              ],
            ),
          )
      ),

    );
  }
}
