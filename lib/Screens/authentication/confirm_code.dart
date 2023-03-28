  // ignore_for_file: must_be_immutable
  import 'package:family_tree/common_widgets/create_button2.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:pin_code_text_field/pin_code_text_field.dart';
  import 'package:provider/provider.dart';
  import '../../app_manager/local_data.dart';

  import '../../cubit/application_state/register_states.dart';
  import '../../cubit/register_cubit.dart';
  import '../../providers/language_provider.dart';
  import '../../utilities/text_style.dart';

  class SendConfirmCode extends StatefulWidget {
    // String userId; String? pageName;
    // SendConfirmCode({required this.userId,this.pageName});
    @override
    State<SendConfirmCode> createState() => _SendConfirmCodeState();
  }

  class _SendConfirmCodeState extends State<SendConfirmCode> {
    LanguageProvider? languageProvider;

    TextEditingController pinController = TextEditingController();

    final GlobalKey<ScaffoldState> _key = GlobalKey();

    bool? isDrawerClosed;
    @override
    void initState() {
      super.initState();
      languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    }

    @override
    Widget build(BuildContext context) {
      languageProvider = Provider.of<LanguageProvider>(context, listen: true);

      return Scaffold(

          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getSize(context: context).height*0.02,vertical: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: mainColor2,
                            size: 30,
                          ),
                          onPressed: () {})),
                ),
                Image.asset("assets/images/splash.png" , height: 200,width: 200,),
                SizedBox(height: 10,),
                Text(
                  languageProvider!.getTexts("enterCode"),
                  style:
                  BlackTitle.display5(context).copyWith(fontSize: 13, color: Colors.grey),
                ),
                SizedBox(
                  height: getSize(context: context).height * 0.07,
                ),
                PinCodeTextField(
                  controller: pinController,
                  autofocus: false,
                  hideCharacter: false,
                  textDirection: languageProvider!.isEnglish==true? TextDirection.ltr:TextDirection.rtl,
                  highlight: false,
                  highlightColor: CupertinoColors.activeBlue,
                  defaultBorderColor: mainColor,
                  hasTextBorderColor: mainColor,
                  maxLength: 4,
                  pinBoxHeight: 40,
                  pinBoxWidth: 60,
                  pinBoxBorderWidth: 1.0,
                  pinBoxRadius: 5.0,
                  isCupertino: true,
                  wrapAlignment: WrapAlignment.center,
                  pinBoxDecoration:
                  ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: getSize(context: context).height * 0.15,
                ),
                BlocProvider(create: (BuildContext context) {
                  return RegisterCubit();
                },
                  child:  BlocConsumer<RegisterCubit, RegisterStates>(
                    builder: (BuildContext context, state) {
                      RegisterCubit registerCubit =
                      RegisterCubit.get(context);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center
                        ,children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CreateButton2(
                             onTap: (){
                               print("Code : ${pinController.text}");
                             }
                            ,title: languageProvider!.getTexts("next"),color: mainColor,),
                        ),
                        Icon(Icons.arrow_forward_ios_sharp,size: 30,color: mainColor,)
                      ],);
                    },
                    listener: (BuildContext context, Object? state) {},
                  ),
                )
              ],
            ),
          ));
    }
  }
