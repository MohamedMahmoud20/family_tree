import 'package:flutter/material.dart';

import '../../common_widgets/creat_news_body.dart';
import 'news_screen.dart';

class AllNews extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CreatNewsBody(),
    );
  }
}