import 'package:flutter/material.dart';

import '../app_manager/local_data.dart';
import '../utilities/text_style.dart';

class MainFamilyTree extends StatefulWidget {
  const MainFamilyTree({Key? key}) : super(key: key);

  @override
  State<MainFamilyTree> createState() => _MainFamilyTreeState();
}

class _MainFamilyTreeState extends State<MainFamilyTree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Center(child: Text(
            "شجرة الأسرة" ,
            style: MainTitle.display5(context).copyWith(
                fontSize: 28 ,
                color:const Color(0xff154C61)),
          )),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: getSize(context: context).width*0.08),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: horizontalContainer(
                        image: Icons.my_library_books_outlined,
                        title: "المكتبه"
                    ),
                  ),
                  verticalContainer(
                      height:  getSize(context: context).height*0.14,
                      image: Icons.newspaper,
                      title: "الاخبار"
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalContainer(
                      size: 50,
                      fontSize: 20,
                      height:  getSize(context: context).height*0.28,
                      image: Icons.account_box_sharp,
                      title: "الدليل"
                  ),
                  Expanded(
                      child:
                      Column(
                        children: [
                          horizontalContainer(image: Icons.accessibility, title: "النسب",
                              size: 60 , fontSize: 25
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: verticalContainer(image: Icons.access_alarm_outlined,
                                  title: "الشخصيات" , size: 45 , fontSize: 18)),
                              Expanded(child: verticalContainer(image: Icons.newspaper, title: "الشجره", size: 45 , fontSize: 18)),
                            ],
                          )
                        ],
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: getSize(context: context).height*0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            designOne(icon: Icons.account_box_sharp , title: "تواصل" , color: mainColor  ,colorTitle:Colors.black),
            designOne(icon: Icons.access_time_filled_sharp , title: "النادي", color: mainColor,colorTitle:Colors.black),
            designOne(icon: Icons.add_card_sharp , title: "الصندوق", color: mainColor,colorTitle:Colors.black),
          ],
        ),
        SizedBox(
          height: getSize(context: context).height*0.05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("احمد", style: MainTitle.display5(context).copyWith(fontSize: 18),),
                  const SizedBox(height: 5,),
                  Text("محمود محمد ابراهيم", style: MainTitle.display5(context).copyWith(fontSize: 16)),
                ],
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Image.network(
                  "https://media.istockphoto.com/id/513472966/photo/young-arabian-man-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=r7ifk4l2pZWjjWEq09V1RmFFRdpudyATmCYhfOxFGxs=",
                  width: 100,
                  // color: Colors.amber,

                ),
              ),

            ],
          ),
        )
      ],
    );
  }

  Widget verticalContainer({
    required String title,
    required  image,
    height,
    width,
    double? size,
    double? fontSize,
  }){
    return  SizedBox(
      // padding: EdgeInsets.all(10),
      height:height??getSize(context: context).height*0.14,
      width:width?? getSize(context: context).width*0.28,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: mainColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(image , color: Colors.white,size: size??40,),
            Text(title, style: WhiteTitle.display5(context).copyWith(fontSize: fontSize??18),),
          ],
        ),
      ),
    );
  }

  Widget horizontalContainer({
    required String title,
    required  image,
    double? height,
    double? size,
    double? fontSize,
  }){
    return  SizedBox(
      height: height?? getSize(context: context).height*0.14,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: mainColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(image, color: Colors.white,size: size??45,),
            Text(title, style: WhiteTitle.display5(context).copyWith(fontSize: fontSize??20.0),),
          ],
        ),
      ),
    );
  }


  Widget designOne({
    required String title,
    required IconData icon,
    double? size,
    Color? color,
    Color? colorTitle,
    double? fontSize,}){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon , color:color??Colors.white,size: size??35),
        Text(title , style: BlackLabel.display5(context).copyWith(fontSize: fontSize??15 , color: colorTitle??Colors.white),)
      ],
    );
  }
}
