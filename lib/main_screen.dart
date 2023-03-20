import 'package:family_tree/app_manager/local_data.dart';
import 'package:family_tree/providers/language_provider.dart';
import 'package:family_tree/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  LanguageProvider? languageProvider;
@override
  void initState() {
  // languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    return  Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Center(child: Text(
                "شجرة الأسرة" ,
                style: MainTitle.display5(context).copyWith(
                    fontSize: 28 ,
                    color:const Color(0xff154C61)),
              )),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: getSize(context: context).width*0.12),
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
                        height:  getSize(context: context).height*0.135,
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
                        height:  getSize(context: context).height*0.27,
                          image: Icons.my_library_books_outlined,
                          title: "المكتبه"
                      ),
                      Expanded(
                        child:
                      Column(
                        children: [
                          horizontalContainer(image: Icons.newspaper, title: "الاخبار"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: horizontalContainer(image: Icons.newspaper, title: "الاخبار" , size: 30 , fontSize: 18)),
                              Expanded(child: horizontalContainer(image: Icons.newspaper, title: "الاخبار", size: 30 , fontSize: 18)),
                            ],
                          )
                        ],
                      )
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )

    );
  }

  Widget verticalContainer({
    required String title,
    required  image,
      height,
      width,
  }){
  return  SizedBox(
    // padding: EdgeInsets.all(10),
    height:height??getSize(context: context).height*0.135,
    width:width?? getSize(context: context).width*0.25,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: mainColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Icon(image , color: Colors.white,size: 40,),
          Text(title, style: WhiteTitle.display5(context).copyWith(fontSize: 18),),
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
    height: height?? getSize(context: context).height*0.135,
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


}
