// import 'package:family_tree/Screens/home_screen.dart';
// import 'package:family_tree/Screens/mission_screen.dart';
// import 'package:family_tree/Screens/setting_screen.dart';
// import 'package:family_tree/app_manager/local_data.dart';
// import 'package:family_tree/providers/language_provider.dart';
// import 'package:family_tree/utilities/text_style.dart';
// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//
//   LanguageProvider? languageProvider;
//   int index=0;
//   List screens=const[
//     HomeScreen(),
//     SettingScreen(),
//     MissionScreen()
//   ];
// @override
//   void initState() {
//   // languageProvider = Provider.of<LanguageProvider>(context, listen: false);
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     // languageProvider = Provider.of<LanguageProvider>(context, listen: false);
//
//     return  Scaffold(
//       body: SafeArea(
//         child: screens[index]
//       ),
//
//     );
//   }
//
//
// }