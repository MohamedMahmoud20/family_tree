import 'package:flutter/material.dart';

import 'news_screen.dart';
import '../../common_widgets/creat_news_body.dart';
class B extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CreatNewsBody(),
    );
  }
}