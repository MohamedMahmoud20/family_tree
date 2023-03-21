import 'package:flutter/material.dart';

import '../../app_manager/routes_manager.dart';
import '../home_screen.dart';

class IdentityScreen extends StatefulWidget {
  const IdentityScreen({Key? key}) : super(key: key);

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        RoutesManager.navigatorAndRemove(context, HomeScreen());
        return true;      },
      child: Scaffold(
        body: Center(
          child: Text("IdentityScreen" , style: TextStyle(fontSize: 30),),
        )
      ),
    );
  }
}
