import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  List<String> languageList = ['English', 'Arabic'];
  bool isEnglish = false;
  Map<String, String> arabicTexts = {
    "login": "تسجيل دخول",
    "mainPage": "الرئيسيه",
    "welcome": "مرحبا بك /",
    "setting": "الاعدادات",
    "contactUs": "تواصل معنا",
    "familyTree": "شجرة الأسرة",
  };
  Map<String, String> englishTexts = {
    "login": "Login",
    "mainPage": "Main Page",
    "welcome": " welcome /",
    "setting": "Setting",
    "contactUs": "Contact Us",
    "familyTree": "Family Tree",
  };

  void changeLanguage({bool? EnglishLanguage}) async {
    final SharedPreferences sharedPrefernce =
        await SharedPreferences.getInstance();

    isEnglish = EnglishLanguage!;
    sharedPrefernce.setBool('savedLanguage', isEnglish);
    notifyListeners();
  }

// ignore: missing_return
  String getTexts(String text) {
    if (isEnglish == true) return englishTexts[text]!;
    return arabicTexts[text]!;
  }

  Future<bool> getLanguage() async {
    final SharedPreferences sharedPrefernce =
        await SharedPreferences.getInstance();

    isEnglish = sharedPrefernce.getBool('savedLanguage') ?? false;

    notifyListeners();
    return isEnglish;
  }
}
