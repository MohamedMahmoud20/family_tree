import 'package:flutter/material.dart';

Size getSize({
  context,
}) {
  Size size = MediaQuery.of(context).size;
  return size;
}

const Color mainColor = Color(0xff1B7D88);
const Color mainColor2 = Color(0xff154C61);
const Color secColor = Colors.white;
const Color greyColor = Color(0xffCBCBCB);
const Color thirdColor = Color(0xff585858);
const String noImage =
    "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg";
const String food = "https://a7sas.net/wp-content/uploads/2019/07/3967.jpg";

///////////  in future we will put all const colors in localdata class

class LocalData {
  static String applicationVersion = "1.0.4.422";
  static String uploadingVersion = "1.0.0.2";
}

String article = " نبنبنميس سيتنتنس ستنيتيسسم يسنيسنيسم "
    "سيمننمسي سيمنيسيسم يسيستني سيتنتيسن ستييستيس تسيتيسيتنس نتسيتيس يسيستيست س"
    "سيمننمسي سيمنيسيسم يسيستني سيتنتيسن ستييستيس تسيتيسيتنس نتسيتيس يسيستيست س";



/////// vvvip increase heaight of text field
// Container(
// margin: EdgeInsets.all(12),
// height: 7 * 24.0,
// child: TextField(
// maxLines: 7,
// decoration: InputDecoration(
// hintText: "اكتب تفاصيل المنتج",
// hintStyle: TextStyle(color: Colors.white, fontSize: 18),
// fillColor: secColor,
// filled: true,
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: mainColor, width: 5.0),
// borderRadius: BorderRadius.all(Radius.circular(13.0))),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: mainColor, width: 5.0),
// borderRadius: BorderRadius.all(Radius.circular(13.0))),
// ),
// ),
// ),
///////////////////////////////////////////
// ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// padding: EdgeInsets.symmetric(horizontal:3),
// physics:  NeverScrollableScrollPhysics(),
// itemCount: 5,
// itemBuilder: (context,index)=>

// crossAxisCount: 3,
// crossAxisSpacing: 2.0,
// mainAxisSpacing: 7.0,
// childAspectRatio: 0.40,

// FaIcon(FontAwesomeIcons.gamepad),
//

// bottom: false, in safe areae
//extendBody: true, in scafo

// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// MembershipTypeScreen()));

//static const route="MyAccountScreen";

