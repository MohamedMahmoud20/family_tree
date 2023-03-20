import 'package:family_tree/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  // Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp( MyApp()); // run app
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const MainScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
    //   MultiBlocProvider(
    //   providers: const [
    //     // BlocProvider(
    //     //     create: (context) =>
    //     //     MainScreenCubit()..getBills(pageName: "Void Main")..getUsersAndSupplier()..getSetting()),
    //   ],
    //   child: ,
    //   // MultiProvider(
    //   //   providers: providers,
    //   //   child: MaterialApp(
    //   //     debugShowCheckedModeBanner: false,
    //   //     home:const SplashScreen(),
    //   //     builder: (context, child) {
    //   //       return MediaQuery(
    //   //         data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    //   //         child: child!,
    //   //       );
    //   //     },
    //   //   ),
    //   // ),
    // );
  }
}