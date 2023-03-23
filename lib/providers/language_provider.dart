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
    "instructionsAndAlerts":"ارشادات وتنبيهات",
    "familyAffairs":"الشؤون الاسرية",
    "MyPage": "صفحتي",
    "treePeople": "افراد من الشجره",
    "lives": "الاقامه",
    "publicNews": "اخبار عامه",
    "birthNews": "اخبار المواليد",
    "deathNews": "اخبار الوفيات",
    "eventNews": "اخبار المناسبات",
    "photoGallery": "معرض الصور",
    "generalCommunication": "تواصل عام",
    "TechnicalCommunications": "البلاغات التقنيه",
    "PersonalForms": "استمارات المعلرمات الشخصيه",
    "communication": "قناوات التواصل مع لجنه الاسره",
    "NewsForms": "استمارات تواصل الاخبار",
    "galleryForms": "استمارات المشاركه في معرض الصور",
    "GeneralForms": "استمارات عامه",
    "copy": "نسخ",
    "open": "فتح",
    "call": "مكالمه",
    "create": "انشاء",
    "inductionTree":  "شجره الاسره التفاعليه",
    "symbolsTree": "شجره التعريف بالرموز والالوان",
    "printedTree": "شجره الاسره المطبوعه",
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
    "instructionsAndAlerts":"Instructions and alerts",
    "familyAffairs":"family affairs",
    "MyPage": "My Page",
    "treePeople": "people from the tree",
    "lives": "Lives",
    "publicNews": "Public news",
    "birthNews": "Birth news",
    "deathNews": "Death news",
    "eventNews": "Event news",
    "photoGallery": "Photo Gallery",
    "generalCommunication": "general communication",
    "TechnicalCommunications": "Technical communications",
    "PersonalForms": "Personal information forms",
    "communication": "Channels of communication with the family committee",
    "NewsForms": "News communication forms",
    "galleryForms": "Participation forms in the photo gallery",
    "GeneralForms": "General forms",
    "copy": "Copy",
    "open": "Open",
    "call": "Call",
    "create": "create",
    "inductionTree":  "Interactive family tree",
    "symbolsTree": "Identification tree with symbols and colors",
    "printedTree": "printed family tree",
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
