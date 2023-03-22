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
// import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class NasabScreen extends StatelessWidget {
  LanguageProvider? languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);

    const htmlData = r""""
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>لورم ایپسوم متن ساختگی با تولید سادگی نا در ستو </h1>
</body>
</html> """;

    return Scaffold(
      appBar: CreatAppBar(
        hasBackButton: false,
        icon: 'assets/images/sitemap.svg',
        iconTitle: languageProvider!.getTexts("nasab"),
        onIconPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash.png",
                height: 200,
                width: 200,
              ),
              Text(
                languageProvider!.getTexts("nasabFamily"),
                style: MainTitle.display5(context).copyWith(fontSize: 20),
              ),
              SizedBox(
                height: getSize(context: context).height * 0.04,
              ),
              // Html(
              //   data: htmlData
              // )
              Text(
                "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
                style: MainTitle.display5(context).copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
