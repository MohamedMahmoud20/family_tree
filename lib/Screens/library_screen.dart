import 'package:family_tree/Screens/photo_gallery_screen.dart';
import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../app_manager/local_data.dart';
import '../common_widgets/creat_app_bar.dart';
import '../common_widgets/creat_search.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';
import 'documents_and_books.dart';

// ignore: must_be_immutable
class LibraryScreen extends StatelessWidget {
  LanguageProvider? languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    return Scaffold(
      appBar: CreatAppBar(hasBackButton:true,
        icon: 'assets/images/folder-open.svg', iconTitle: languageProvider!.getTexts("library"), onIconPressed: () {  },
      ),

      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 15),
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
          SizedBox(height: 15,),
          Container(
            height: getSize(context: context).height * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: mainColor, width: 1),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/testt.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          creatTaps(
            onTap: () {
              RoutesManager.navigatorPush(context, PhotoGallery());
            },
            context: context,
            backGroundImage: "assets/images/testt.png",
            Icon: "assets/images/camera.svg",
            albumsCount: "${languageProvider!.getTexts("albums")}     ٢٠",
            imagesCount: "${languageProvider!.getTexts("photos")}    ٣٠٠",
            count: "",
            isDocuments: false,
            iconTitle: languageProvider!.getTexts("gallery"),
          ),
          creatTaps(
            onTap: () {
              RoutesManager.navigatorPush(context, DocumentsAndBooks());

            },
            context: context,
            backGroundImage: "assets/images/testt.png",
            Icon: "assets/images/book2.svg",
            count: "${languageProvider!.getTexts("num")}   ٤٠",
            albumsCount: "",
            imagesCount: "",
            isDocuments: true,
            iconTitle: languageProvider!.getTexts("documentsAndBooks"),
          ),
        ],
      ),
    );
  }

  Widget creatTaps(
      {required BuildContext context,
        required String backGroundImage,
        required String Icon,
        required String albumsCount,
        required String imagesCount,
        required String count,
        required bool isDocuments,
        required String iconTitle,
        required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: getSize(context: context).height * 0.19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      backGroundImage,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: mainColor,
                    ),
                    height: 35,
                    child: isDocuments == true
                        ? Text(
                      count,
                      style: WhiteTitle.display5(context),
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          albumsCount.toString(),
                          style: WhiteTitle.display5(context),
                        ),
                        Text(
                          imagesCount.toString(),
                          style: WhiteTitle.display5(context),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                textDirection: languageProvider!.isEnglish == true
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.white,

                        child: SvgPicture.asset(
                          Icon,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        iconTitle,
                        style: WhiteLabel.display5(context),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
