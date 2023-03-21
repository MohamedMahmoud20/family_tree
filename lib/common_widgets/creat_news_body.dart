import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

// ignore: must_be_immutable
class CreatNewsBody extends StatelessWidget {

  List<News> news =[
    News(image:"",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2040"),
    News(image:"",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2040"),
    News(image:"",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2040"),
    News(image:"assets/images/testt.png",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2020"),
    News(image:"assets/images/testt.png",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2020"),
    News(image:"",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2010"),
    News(image:"",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2040"),
    News(image:"assets/images/testt.png",title:"ترقيه ابراهيم محمد عبدالله للمرتبه  السابعه",date:"2030"),

  ];
  LanguageProvider? languageProvider;
  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return   Directionality(
      textDirection:
      languageProvider!.isEnglish == true
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          children: [

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("جميع الاخبار",style: BlackTitle.display5(context),),
                Text("لم تقرأ",style: BlackTitle.display5(context),),
                SizedBox(),
                SizedBox(),
              ],),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: news.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text(news[index].date!,
                              style: MainTitle.display5(context)),
                          SizedBox(height: 5,),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              news[index].image!.isEmpty?SizedBox():    Container(
                                  height:
                                  getSize(context: context).height * 0.25,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey,width: 1),
                                      image: new DecorationImage(
                                        image: new AssetImage(
                                            news[index].image!),
                                        fit: BoxFit.cover,
                                      ))),



                              Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: getSize(context: context).height * 0.06,
                                  width: getSize(context: context).width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    textDirection:
                                    languageProvider!.isEnglish == true
                                        ? TextDirection.ltr
                                        : TextDirection.rtl,
                                    children: [
                                      // SizedBox(width: 20,),
                                      Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10),
                                          // color: Colors.green,
                                        child:   SvgPicture.asset(
                                             "assets/images/menu.svg",
                                             color: mainColor,
                                           )

                                      ),

                                      Flexible(
                                        child: Container(
                                          // color: Colors.deepOrange,
                                          child: Text(
                                            news[index].title!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: BlackTitle.display5(context),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class News{
  String ?image;
  String ?title;
  String ?date;
  News({ this
      .title,this.date,this.image});
  News.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    date = json['date'];}
}
