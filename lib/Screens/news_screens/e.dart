import 'package:flutter/material.dart';

import 'news_screen.dart';
import '../../common_widgets/creat_news_body.dart';
class E extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CreatNewsBody(),
    );
  }
}