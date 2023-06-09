import 'package:flutter/material.dart';

class TreeTest extends StatefulWidget {
  const TreeTest({Key? key}) : super(key: key);

  @override
  State<TreeTest> createState() => _TreeTestState();
}

class _TreeTestState extends State<TreeTest> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.all(200),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(1115454)
                ),
                child: Text("98888")
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(angle: 121,alignment: Alignment.topCenter,child: Container(
                  height: 300,
                  width: 2,
                  color: Colors.black,
                ),),
                Transform.rotate(angle: 30,alignment: Alignment.topCenter,child: Container(
                  height: 300,
                  width: 2,
                  color: Colors.black,
                ),),
                Transform.rotate(angle: 95,alignment: Alignment.topCenter,child: Container(
                  height: 300,
                  width: 2,
                  color: Colors.black,
                ),),
                Transform.rotate(angle: 40,alignment: Alignment.topCenter,child: Container(
                  height: 300,
                  width: 2,
                  color: Colors.black,
                ),),


              ],
            )

          ],
        ),
      ),
    );
  }
}
