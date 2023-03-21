import 'package:flutter/material.dart';

class CreatBackGround extends StatelessWidget {
  final Widget child;
final String? image;
   CreatBackGround({super.key, required this.child,  this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body:Stack(children: [
        Container(

          height: double.infinity,
          decoration: BoxDecoration(

              image:
              DecorationImage(
                  image: AssetImage(image??"assets/images/background.png",




                  ),fit: BoxFit.fill)

          ),
        ),
      child
      ],)
    );
  }
}
