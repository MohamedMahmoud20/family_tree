import 'package:family_tree/Screens/home_screen.dart';
import 'package:family_tree/app_manager/routes_manager.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async {
          RoutesManager.navigatorAndRemove(context, HomeScreen());
          return true;
        },
        child: Scaffold(body:
        const Center(
          child: Text("SettingScreen" , style: TextStyle(fontSize: 30),),
        ),),
      );

  }
}
