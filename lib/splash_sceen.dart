import 'package:family_tree/Screens/briths_screens/briths_screen.dart';
import 'package:family_tree/Screens/guide_screens/guide_screen.dart';
import 'package:family_tree/Screens/home_screen.dart';
import 'package:family_tree/Screens/tree_screens/tree_screen.dart';
import 'package:family_tree/app_manager/local_data.dart';
import 'package:family_tree/providers/language_provider.dart';
import 'package:family_tree/utilities/text_style.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/authentication/confirm_code.dart';
import 'Screens/chaaracters_screen.dart';
import 'Screens/authentication/complete_data.dart';
import 'Screens/authentication/information_login.dart';
import 'Screens/authentication/login_screen.dart';
import 'Screens/authentication/restore_info_login.dart';
import 'Screens/contact_us/contact_us.dart';
import 'Screens/deaths_screen/death_screen.dart';
import 'Screens/documents_and_books.dart';
import 'Screens/library_screen.dart';
import 'Screens/nasab_screen.dart';
import 'Screens/photo_gallery_screen.dart';
import 'app_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  LanguageProvider? languageProvider;
//
late  AnimationController animationControllerParent;
late  Animation<Offset> animation;


  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    languageProvider!.getLanguage();


    animationControllerParent=AnimationController(vsync: this , duration: Duration(milliseconds: 200));

    animation=Tween(begin: Offset(0, 2), end: Offset.zero).animate(animationControllerParent);
animationControllerParent.forward();

Future.delayed(Duration(seconds: 2) ,(){
    // if ((userId!=null)&&activationCode.isEmpty==true) {
    //   RoutesManager.navigatorAndRemove(context, MainScreen());
    // }
    //
    // else {
      RoutesManager.navigatorAndRemove(context, SendConfirmCode());
  //   }

});

//     String? userId = SharedPreference.getData(key: 'userId');
//     String activationCode = SharedPreference.getData(key: 'activationCode')??"";
// // print("splash activationCode : $activationCode");
//     print("splash UserId : ${userId}");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: getSize(context: context).height*0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/splash.png",
                    ),
                    fit: BoxFit.contain)),

          ),
          SizedBox(height: 10,),
         AnimatedBuilder(animation: animation, builder: (context , _)=> SlideTransition(
             position: animation,
             child: Text("المقرن" , style: MainTitle.display5(context).copyWith(fontSize: 21),)))
        ],
      ),
    );
  }
}
