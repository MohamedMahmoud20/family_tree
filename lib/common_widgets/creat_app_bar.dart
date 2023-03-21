import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../app_manager/local_data.dart';
import '../main_screen.dart';
import '../providers/language_provider.dart';
import '../utilities/text_style.dart';

class CreatAppBar extends StatefulWidget with PreferredSizeWidget {
  final String? label,pageName;
  final Size preferredSize;
  final bool? isDrawerClosed,
      showOnlyBackButton,
      showDeleteButton,
      showCloseButton,comingAfterPaymentIsDone,
      hasElevation;
  final void Function()? deleteFunction;
  final keyy;
  Color? color;

  CreatAppBar({
    Key? key,
    this.color,
    this.showCloseButton,
    this.showDeleteButton,
    this.showOnlyBackButton,
    required this.keyy,
    this.label,
    this.hasElevation,
    required this.isDrawerClosed,
    this.deleteFunction, this.pageName, this.comingAfterPaymentIsDone,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  State<CreatAppBar> createState() => _CreatAppBarState();
}

class _CreatAppBarState extends State<CreatAppBar> {
  LanguageProvider? languageProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: languageProvider!.isEnglish == true
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: AppBar(
          backgroundColor: widget.color ?? Colors.transparent,
          elevation: widget.hasElevation == true ? 2 : 0,
          centerTitle: true,
          primary: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              // ( BlocProvider.of<ReceiveRestaurantCubit>(context)!.cartData!.length==0&&widget.pageName=="OrderDetailsScreen") ?
              // widget.comingAfterPaymentIsDone==true?
              //  RoutesManager.navigatorAndRemove(context, MainScreen()):
              // RoutesManager.pop(context);
              // Navigator.pop(context);
            },
            icon: Icon(
              widget.showCloseButton == true
                  ? Icons.clear_outlined
                  : Icons.arrow_back_ios_rounded,
              color: widget.showCloseButton == true ? Colors.red : mainColor,
            ),
          ),
          title: Text(
            widget.label ?? " ",
            style: BlackTitle.display5(context).copyWith(color: mainColor),
          ),
          actions: widget.showDeleteButton == true
              ? [
                  IconButton(
                    onPressed: widget.deleteFunction,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ]
              : widget.showOnlyBackButton == true
                  ? null
                  : [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isDrawerClosed != false;
                          });

                          if (widget.keyy.currentState!.isDrawerOpen ||
                              widget.keyy.currentState!.isEndDrawerOpen) {
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              widget.isDrawerClosed != false;
                            });
                            languageProvider!.isEnglish == true
                                ? widget.keyy.currentState!.openDrawer()
                                : widget.keyy.currentState!.openEndDrawer();
                          }
                        },
                        icon: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: (widget.isDrawerClosed == false ||
                                        widget.isDrawerClosed == null)
                                    ? Colors.transparent
                                    : mainColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(Icons.menu,
                                size: 25,
                                color: (widget.isDrawerClosed == false ||
                                        widget.isDrawerClosed == null)
                                    ? mainColor
                                    : Colors.white)),
                        color: mainColor,
                      ),
                    ]),
    );
  }
}

// import 'package:fancy/app_manger/local%20data.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
//
// import '../providers/language_provider.dart';
// import '../utilities/text_style.dart';
//
// class CreatAppBar extends StatefulWidget with PreferredSizeWidget {
//   final String? label, pageName;
//   final Function? onDrawerPressed;
//   final Size preferredSize;
//   final keyy;
//
//   CreatAppBar({
//     Key? key,
//     this.label,
//     this.onDrawerPressed,
//     this.pageName,
//     required this.keyy,
//   })  : preferredSize = Size.fromHeight(80.0),
//         super(key: key);
//
//   @override
//   State<CreatAppBar> createState() => _CreatAppBarState();
// }
//
// class _CreatAppBarState extends State<CreatAppBar> {
//   LanguageProvider? languageProvider;
//
//   GlobalKey<ScaffoldState> key = GlobalKey();
//
//   bool? isDrawerPressed = false;
//
//   @override
//   void initState() {
//     super.initState();
//     key = widget.keyy;
//     languageProvider = Provider.of<LanguageProvider>(context, listen: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     languageProvider = Provider.of<LanguageProvider>(context, listen: true);
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       centerTitle: true,
//       actions: [Container()],
//       automaticallyImplyLeading: false,
//       title: Directionality(
//           textDirection: languageProvider!.isEnglish == true
//               ? TextDirection.ltr
//               : TextDirection.rtl,
//           child: Stack(
//             children: [
//               Center(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 25.0),
//                   child: Text(
//                     widget.label ?? " ",
//                     style: BlackTitle.display5(context)
//                         .copyWith(color: blackColor),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 20.0),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // setState(() {
//                           //   isDrawerPressed=!isDrawerPressed!;
//                           // });
//
//                           print("VVVVVVVVVVVVVVVVVV$isDrawerPressed");
//
//                           languageProvider!.isEnglish == true
//                               ? key.currentState!.openDrawer()
//                               : key.currentState!.openEndDrawer();
//                           final RenderObject? box =
//                               key!.currentContext!.findRenderObject();
//                           if (box != null) {
//                             print("WWWWWWWWWWWW");
//                           } else {
//                             print("RRRRRRRRRRRRR");
//                           }
//
//                           // widget.onDrawerPressed!();
//                         },
//                         icon: Container(
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 color: isDrawerPressed == true
//                                     ? mainColor
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Icon(
//                               Icons.menu,
//                               size: 25,
//                               color: isDrawerPressed == true
//                                   ? Colors.white
//                                   : blackColor,
//                             )),
//                         color: blackColor,
//                       ),
//                       Directionality(
//                         textDirection: languageProvider!.isEnglish == true
//                             ? TextDirection.rtl
//                             : TextDirection.ltr,
//                         child: IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Icons.arrow_back_ios_rounded,
//                             color: blackColor,
//                           ),
//                         ),
//                       ),
//                     ]),
//               ),
//             ],
//           )),
//     );
//   }
// }
