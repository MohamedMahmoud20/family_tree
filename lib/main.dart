import 'package:family_tree/Screens/home_screen.dart';
import 'package:family_tree/services/shared_preference.dart';
import 'package:family_tree/splash_sceen.dart';
import 'package:family_tree/test_tree.dart';
import 'package:family_tree/utilities/providers.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/main-cubit.dart';
import 'cubit/news-cubit.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cubit/observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  // Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp()); // run app
} // void main

//////////////////////////////////////////////////////


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => NewsCubit()),
      ],
      child:
      MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TreeTest(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        ),
      ),);
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// flutter pub run flutter_launcher_icons:main
// myList.removeWhere((item) => ["", null, false, 0].contains(item));
// id of uuu 629cc18997bc6063f191a910"
// overflow: TextOverflow.ellipsis,

// textDirection: languageProvider!.isEnglish == true
// ? TextDirection.ltr
//     : TextDirection.rtl,

// decoration: new BoxDecoration(
// image: new DecorationImage(
// image: new AssetImage("assets/images/brand.png"),
// fit: BoxFit.cover,
// )
// )
// decoration:  BoxDecoration(
// border: Border(
// left: BorderSide(
// color: Colors.black,
// width: 3.0,
// ),
// top: BorderSide(
// color: Colors.black,
// width: 3.0,
// ),
// ),
// ),

// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// MembershipTypeScreen()));

////////////////
// icon: Icon(
// Icons.clear,
// size: getSize(context: context).width*0.06,
// color: Colors.black,
// )),
////////////////////
// SystemChannels.textInput.invokeMethod('TextInput.hide');
// margin: EdgeInsets.symmetric(
// horizontal: getSize(context: context).width * 0.04,
// vertical: getSize(context: context).width * 0.1),

// getSize(context: context).height
// LanguageProvider languageProvider;

// final GlobalKey<ScaffoldState> _key = GlobalKey();

// languageProvider.isEnglish == true
// ? TextDirection.ltr
//     : TextDirection.rtl,

// @override
// void initState() {
//   super.initState();
//   languageProvider = Provider.of<LanguageProvider>(context, listen: false);
// }
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// key: _key,
// drawer: CreatDrawer(),
// endDrawer: CreatDrawer(),
// backgroundColor: secColor,
// appBar: CreatAppBar(
// label: languageProvider.getTexts("categories"),
// onDrawerPressed: () {
// languageProvider.isEnglish == true
// ? _key.currentState.openDrawer()
//     : _key.currentState.openEndDrawer();
// },
// ),
// );}
/////////////////////////////////
// getSize(context: context).height
// navigateDotPushReplacement(context:context,PageName:MainCategoriesScreen());
// horizontal:getSize(context: context).width*0.04
/////////////////////////////////
// Container(
// margin: EdgeInsets.symmetric(
// vertical: getSize(context: context).width * 0.2,
// ),
// width: getSize(context: context).width * 0.5,
// height: getSize(context: context).width * 0.4,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage("assets/images/logo.png"),
// fit: BoxFit.fill,
// )),
// ),