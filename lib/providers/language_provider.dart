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
    "guideUpdate":"تحديث الدليل",
    "guide":"الدليل",
    "grand":"الجد",
    "sonOrcousin":"ابن او بنت عم",
    "brotherOrSister":"اخ او اخت",
    "son":"ابن او ابنه",
    "search":"البحث",
    "allBranch":"جميع الفروع",
    "all":"الكل",
    "alive":"الاحياء",
    "death":"الاموات",
    "library":"المكتبه",
    "news":"الاخبار",
    "characters":"الشخصيات",
    "tree":"الشجره",
    "contact":"تواصل",
    "box":"الصندوق",
    "club":"النادي",
    "mission":"المهام",
    "identity":"الهويه",
    "nasab":"النسب",
    "gallery":"معرض الصور",
    "documentsAndBooks":"الوثائق والمخطوطات",
    "albums":"الالبومات",
    "photos":"الصور",
    "num":"العدد",
    "nasabFamily":"نسب الاسره",
  };
  Map<String, String> englishTexts = {
    "login": "Login",
    "mainPage": "Main Page",
    "welcome": " welcome /",
    "setting": "Setting",
    "contactUs": "Contact Us",
    "familyTree": "Family Tree",
    "guideUpdate":"Guide Update",
    "guide":"Guide",
    "grand":"grand father",
    "sonOrcousin":"son or cousin",
    "brotherOrSister":"brother and sister",
    "son":"son",
    "search":"Search",
    "allBranch":"All branches",
    "all":"All",
    "alive":"A live",
    "death":"the dead",
    "library":"Library",
    "news":"News",
    "characters":"Characters",
    "tree":"Tree",
    "contact":"Contact",
    "box":"The Box",
    "club":"The Club",
    "mission":"Mission",
    "identity":"Identity",
    "nasab":"Nasab",
    "gallery":"Gallery",
    "documentsAndBooks":"Documents and Books",
    "albums":"Albums",
    "photos":"Photos",
    "num":"num",
    "nasabFamily":"Nasab",
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
