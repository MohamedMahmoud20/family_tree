
import 'package:family_tree/Screens/guide_screens/guide_screen.dart';
import 'package:family_tree/Screens/home_screen.dart';
import 'package:family_tree/Screens/tree_screens/tree_screen.dart';
import 'package:family_tree/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/chaaracters_screen.dart';
import 'Screens/contact_us/contact_us.dart';
import 'Screens/documents_and_books.dart';
import 'Screens/library_screen.dart';
import 'Screens/nasab_screen.dart';
import 'Screens/photo_gallery_screen.dart';
import 'app_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LanguageProvider? languageProvider;

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    languageProvider!.getLanguage();

//     String? userId = SharedPreference.getData(key: 'userId');
//     String activationCode = SharedPreference.getData(key: 'activationCode')??"";
// // print("splash activationCode : $activationCode");
//     print("splash UserId : ${userId}");

    Future.delayed(Duration(seconds: 2), () {
    //   if ((userId!=null)&&activationCode.isEmpty==true) {
    //     RoutesManager.navigatorAndRemove(context, MainScreen());
    //   }
    //
    //   else {
        RoutesManager.navigatorAndRemove(context, HomeScreen());
    //   }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/splash.png",
                ),
                fit: BoxFit.contain)),

      ),
    );
  }
}
