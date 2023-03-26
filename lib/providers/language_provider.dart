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
    "births": "المواليد",
    "deaths": "الوفيات",
    "review": "مراجعه",
    "close": "اغلاق",
    "next": "التالي",
    "click": "اضفط",
    "infoDeath": "معلومات المتوفي/المتوفية",
    "infoDeath2": "الرجاء اختيار الشخص الذي تود الإبلاغ عن وفاته من خلال الخيارين التاليين",
    "deathNewsForm": "استمارة اخبار الوفيات. إرسالك لأي موضوع في هذا القسم هو موافقتك على نشره في تطبيق الاسرة",
    "birthNewsForm": "استمارة اخبار المواليد. إرسالك لأي موضوع في هذا القسم هو موافقتك على نشره في تطبيق الاسرة",
    "parentInfo": "معلومات الوالدين",
    "chooseParent": "الرجاء إختيار والد او والدة الطفل من الدليل",
    "motherInfo":"معلومات الام",
    "fatherInfo":"معلومات الاب",
    "pressContact":"في حالة عدم وجود اسم الأم في القائمة يرجى الإبلاغ من خلال ايقونه تواصل",
    "insideFamily":"من داخل الاسره",
    "outsideFamily":"من خارج الاسره",
    "gender":"الجنس",
    "babyName":"اسم المولود رباعي",
    "firstName":"الاسم الاول",


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
    "births": "Births",
    "review": "Review",
    "deaths": "Deaths",
    "next": "Next",
    "close": "Close",
    "click": "Click",
    "infoDeath": "Deceased/deceased information",
    "parentInfo": "Parent information",
    "infoDeath2": "    Please select the person whose death you would like to report from the following two options",
    "deathNewsForm": "Death news form. By submitting any topic in this section, you agree to publish it in the Al-Osra application",
    "birthNewsForm": "Birth news form. By submitting any topic in this section, you agree to publish it in the Al-Osra application",
    "chooseParent": "Please choose the father and mother of the child from the directory",
    "motherInfo":"Mother's information",
    "fatherInfo":"Father's information",
    "pressContact":"In the event that the mother's name is not in the list, please report it through the communication icon",
    "insideFamily":"Inside Family",
    "outsideFamily":"Outside Family",
    "gender":"Gender",
    "babyName":"Quadruple baby name",
    "firstName":"First name",


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
