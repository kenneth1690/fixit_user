import 'dart:developer';
import 'package:fixit_user/common/languages/language_helper.dart';
import 'package:fixit_user/config.dart';

class LanguageProvider with ChangeNotifier {
  String currentLanguage = appFonts.english;
  Locale? locale;
  int selectedIndex = 0;
  final SharedPreferences sharedPreferences;


  LanguageProvider(this.sharedPreferences) {
    var selectedLocale = sharedPreferences.getString("selectedLocale");

    if (selectedLocale != null) {
      // set language which came from storage if save any language
      locale = Locale(selectedLocale);
    } else {
      // set default
      selectedLocale = "spanish";
      locale = const Locale("es");
    }

    setVal(selectedLocale);

  }

  LanguageHelper languageHelper = LanguageHelper();

  void changeLocale(String newLocale) {
    log("sharedPreferences a1: $newLocale");
    Locale convertedLocale;

    currentLanguage = newLocale;
    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);

    locale = convertedLocale;
    sharedPreferences.setString(
        'selectedLocale', locale!.languageCode.toString());
    notifyListeners();
  }

  getLocal() {
    var selectedLocale = sharedPreferences.getString("selectedLocale");
    return selectedLocale;
  }

  defineCurrentLanguage(context) {
    String? definedCurrentLanguage;

    if (currentLanguage.isNotEmpty) {
      definedCurrentLanguage = currentLanguage;
    } else {
      print(
          "locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }

    return definedCurrentLanguage;
  }

  setVal(value) {
    if (value == "en") {
      currentLanguage = "english";
    } else if (value == "fr") {
      currentLanguage = "french";
    } else if (value == "es") {
      currentLanguage = "spanish";
    } else if (value == "ar") {
      currentLanguage = "arabic";
    } else {
      currentLanguage = "english";
    }
    notifyListeners();
    changeLocale(currentLanguage);
  }

  setIndex(index){
    selectedIndex = index;
    notifyListeners();

  }
}
