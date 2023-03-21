import 'package:family_tree/Screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../app_manager/routes_manager.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        RoutesManager.navigatorAndRemove(context, HomeScreen());
        return true;
        },
      child: Scaffold(body:
      const Center(
        child: Text("MissionScreen" , style: TextStyle(fontSize: 30),),
      ),),
    );
  }
}
